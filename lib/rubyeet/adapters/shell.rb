require "readline"

module Rubyeet
  module Adapters
    class Shell < Base
      PROMPT = "> "

      SOURCE = "shell"

      USAGE = "Type `exit` or `quit` to end the session."
      HISTORY_FILE = "~/.rubyeet_history"

      attr_accessor :stopped

      def initialize(*args)
        super(args.first)
        remember
      end

      def run
        explain
        listen
      end

      def say(message)
        Rubyeet.logger.info(message[:body])
      end

      private

      def explain
        Rubyeet.logger.info(USAGE)
      end

      def read
        Readline.readline(PROMPT, true).tap { |line|history_file.puts(line) }
      end

      def listen
        step until stopped?
      rescue Interrupt
        stop
      end

      def step
        body = read
        case body
        when "exit", "quit" then stop
        else
          random_tweet(body)
          bot.receive(body: body, source: SOURCE)
        end
      end

      def random_tweet(body)
        random = Rubyeet::Twitter::RandomTweet.new
        Rubyeet.logger.info(random.tweet) if random.tweet_this_time?
      end

      def stopped?
        !!stopped
      end

      def stop
        self.stopped = true
      end

      def remember
        return unless history_pathname.exist?
        history_pathname.each_line { |line|Readline::HISTORY << line.rstrip }
      end

      def history_pathname
        @history_pathname ||= Pathname.new(HISTORY_FILE).expand_path
      end

      def history_file
        history_file = history_pathname.open('a')
        @history_file ||= history_file.tap { |file|file.sync = true }
      end
    end
  end
end