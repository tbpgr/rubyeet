require 'rubyeet'
require 'thor'

module Rubyeet
  class CLI < Thor
    class_option :help, type: :boolean, aliases: '-h', desc: 'help message.'
    class_option :version, type: :boolean, desc: 'version'
    class_option :debug, type: :boolean, aliases: '-d', desc: 'debug mode'

    desc 'start', "Start rubyeet"
    def start
      setting_debug_mode
      Rubyeet::Bot.new.run
    rescue => e
      output_error_if_debug_mode(e)
      exit(false)
    end

    desc 'version', 'version'
    def version
      p Rubyeet::VERSION
    end

    private

    def setting_debug_mode
      $DEBUG = options[:debug]
    end

    def output_error_if_debug_mode(e)
      return unless options[:debug]
      STDERR.puts(e.backtrace)
    end
  end
end
