module Rubyeet
  class Bot
    DEFAULT_ENV = 'development'
    DEFAULT_RUBYEET_NAME = 'rubyeet'
    attr_reader :options, :env, :name
    include Mem

    def initialize(options = {})
      @options = options
    end

    def run
      load_env
      load_gems
      load_optional_rb
      setup_name
      setup_brain
      # handlers
      adapt
    end

    def receive(attributes)
      message = Message.new(attributes.merge(bot: self))
      unless handlers.inject(false) { |matched, handler| matched | handler.call(message) }
        handlers.each { |handler|handler.call(message, missing: true) }
      end
    end

    def brain
      Brains::Base.klass.new
    end
    memoize :brain

    def load_env
      @env = 
        if options[:dotenv]
          ::Dotenv.load
          ENV['RUBYEET_ENV']
        else
          DEFAULT_ENV
        end
    end

    def load_gems
      Bundler.require(:default, env)
    rescue Bundler::GemfileNotFound
    end

    def load_optional_rb
      load(options[:load]) if options[:load]
    end

    def setup_name
      @name = 
        if options[:dotenv]
          ::Dotenv.load
          ENV['RUBYEET_NAME']
        else
          DEFAULT_RUBYEET_NAME
        end
    end

    def setup_brain
      brain
    end

    def setup_random_tweet
      Rubyeet::Twitter::RandomTweet.new
    end
    memoize :setup_random_tweet

    def handlers
      Rubyeet.handlers.map { |handler_class| handler_class.new(self) }
    end
    memoize :handlers

    def handle
      handlers
    end

    def adapt
      adapter.run
    end

    def adapter
      AdapterBuilder.new(self).build
    end
    memoize :adapter
  end
end
