# encoding: utf-8
require "spec_helper"
require "rubyeet/bot"

describe Rubyeet::Bot do
  context :initialize do
    cases = [
      {
        case_no: 1,
        case_title: "with dotenv options",
        options: { dotenv: true, load: 'hoge.rb' },
        expected: { dotenv: true, load: 'hoge.rb' }
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          rubyeet_bot = Rubyeet::Bot.new(c[:options])
          actual = rubyeet_bot.options

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end

  context :load_env do
    cases = [
      {
        case_no: 1,
        case_title: "default env",
        options: {},
        expected: "development"
      },
      {
        case_no: 2,
        case_title: "load dotenv env",
        options: { dotenv: true, load: 'hoge.rb' },
        expected: "production"
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          rubyeet_bot = Rubyeet::Bot.new(c[:options])

          # -- when --
          rubyeet_bot.load_env
          actual = rubyeet_bot.env

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end

  context :load_optional_rb do
    cases = [
      {
        case_no: 1,
        case_title: "not load optional rb",
        options: {},
        expected: false,
      },
      {
        case_no: 2,
        case_title: "load optional rb",
        options: { dotenv: true, load: 'sample_load/sample_load.rb' },
        expected: true,
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          rubyeet_bot = Rubyeet::Bot.new(c[:options])
          rubyeet_bot.load_env

          # -- when --
          rubyeet_bot.load_optional_rb
          actual = Kernel.const_defined?(:SampleLoad)

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end

  context :setup_brain do
    cases = [
      {
        case_no: 1,
        case_title: "setup default brain",
        expected: {}
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          rubyeet_bot = Rubyeet::Bot.new({})

          # -- when --
          rubyeet_bot.setup_brain
          actual = rubyeet_bot.brain

          # -- then --
          expect(actual.data).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end

  context :setup_name do
    cases = [
      {
        case_no: 1,
        case_title: "default name",
        options: {},
        expected: "rubyeet",
      },
      {
        case_no: 2,
        case_title: "load dotenv name",
        options: { dotenv: true, load: 'hoge.rb' },
        expected: "tbpgr_bot",
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          rubyeet_bot = Rubyeet::Bot.new(c[:options])
          rubyeet_bot.load_env

          # -- when --
          rubyeet_bot.setup_name
          actual = rubyeet_bot.name

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end

  context :setup_random_tweet do
    cases = [
      {
        case_no: 1,
        case_title: "load ./config/Randomtweet",
        expected_tweets: %w(tweet1 tweet2 tweet3),
        expected_enable: true,
        expected_frequency: 20
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          rubyeet_bot = Rubyeet::Bot.new

          # -- when --
          actual = rubyeet_bot.setup_random_tweet
          actual_tweets = actual.tweets
          actual_enable = actual.enable
          actual_frequency = actual.frequency

          # -- then --
          expect(actual_tweets).to eq(c[:expected_tweets])
          expect(actual_enable).to eq(c[:expected_enable])
          expect(actual_frequency).to eq(c[:expected_frequency])
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end
end
