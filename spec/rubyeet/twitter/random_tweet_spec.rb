# encoding: utf-8
require "spec_helper"
require "rubyeet/twitter/random_tweet"

describe Rubyeet::Twitter::RandomTweet do
  context :initialize do
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
          rubyeet_twitter_random_tweet = Rubyeet::Twitter::RandomTweet.new

          # -- when --
          actual_tweets = rubyeet_twitter_random_tweet.tweets
          actual_enable = rubyeet_twitter_random_tweet.enable
          actual_frequency = rubyeet_twitter_random_tweet.frequency

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

  context :enable? do
    cases = [
      {
        case_no: 1,
        case_title: "enable case",
        enable: true,
        expected: true
      },
      {
        case_no: 2,
        case_title: "disable case",
        enable: false,
        expected: false
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          rubyeet_twitter_random_tweet = Rubyeet::Twitter::RandomTweet.new
          rubyeet_twitter_random_tweet.instance_variable_set(:@enable, c[:enable])

          # -- when --
          actual = rubyeet_twitter_random_tweet.enable?

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

  context :disable? do
    cases = [
      {
        case_no: 1,
        case_title: "enable case",
        enable: true,
        expected: false
      },
      {
        case_no: 2,
        case_title: "disable case",
        enable: false,
        expected: true
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          rubyeet_twitter_random_tweet = Rubyeet::Twitter::RandomTweet.new
          rubyeet_twitter_random_tweet.instance_variable_set(:@enable, c[:enable])

          # -- when --
          actual = rubyeet_twitter_random_tweet.disable?

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

  context :frequency do
    cases = [
      {
        case_no: 1,
        case_title: "frequency case",
        expected: 20
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          rubyeet_twitter_random_tweet = Rubyeet::Twitter::RandomTweet.new

          # -- when --
          actual = rubyeet_twitter_random_tweet.frequency

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

  context :tweet_this_time? do
    cases = [
      {
        case_no: 1,
        case_title: "always true case",
        frequency: 100,
        expected: true
      },
      {
        case_no: 2,
        case_title: "always false case",
        frequency: 0,
        expected: false
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          rubyeet_twitter_random_tweet = Rubyeet::Twitter::RandomTweet.new
          rubyeet_twitter_random_tweet.instance_variable_set(:@frequency, c[:frequency])

          # -- when --
          actual = rubyeet_twitter_random_tweet.tweet_this_time?

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

  context :tweets do
    cases = [
      {
        case_no: 1,
        case_title: "tweets case",
        expected: %w(tweet1 tweet2 tweet3)
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          rubyeet_twitter_random_tweet = Rubyeet::Twitter::RandomTweet.new

          # -- when --
          actual = rubyeet_twitter_random_tweet.tweets

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

  context :tweet do
    cases = [
      {
        case_no: 1,
        case_title: "random tweet"
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          rubyeet_twitter_random_tweet = Rubyeet::Twitter::RandomTweet.new

          # -- when --
          actual = rubyeet_twitter_random_tweet.tweet

          puts actual
          # -- then --
          expect(rubyeet_twitter_random_tweet.tweets).to include(actual)
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
