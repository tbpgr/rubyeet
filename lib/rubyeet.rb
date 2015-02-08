require "rubyeet/version"
require "dotenv"
require 'bundler'
require 'mem'
require "rubyeet/logger"

module Rubyeet
  class << self
    include Mem

    def logger
      @logger ||= Rubyeet::Logger.new($stdout)
    end

    def die(message)
      logger.error("Error: #{message}")
      exit(1)
    end
  end
end

require "rubyeet/env"
require "rubyeet/env/validatable"
require "rubyeet/env/validation_error"
require "rubyeet/env/missing_required_key_error"

require "rubyeet/brains/base"
require "rubyeet/brains/memory"
require "rubyeet/twitter/random_tweet"
require "rubyeet/adapters/base"
# require "rubyeet/adapters/shell"
