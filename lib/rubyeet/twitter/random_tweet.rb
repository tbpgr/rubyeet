# encoding: utf-8

module Rubyeet::Twitter
  class RandomTweet
    DEFAULT_TWEETS = %w(hello oh (^_^))
    DEFAULT_ENABLED = false
    DEFAULT_FREQUENCY = 10
    RANDOMTWEET_PATH = './config/Randomtweet'
    attr_reader :tweets, :enabled, :frequency

    def initialize
      @tweets = DEFAULT_TWEETS
      @enabled = DEFAULT_ENABLED
      @frequency = DEFAULT_FREQUENCY
      return unless File.exist?(RANDOMTWEET_PATH)
      random_tweet_settings = File.read(RANDOMTWEET_PATH)
      instance_eval random_tweet_settings
    end

    # setup_tweets (for Randomtweet file dsl)
    def setup_tweets(tweets = DEFAULT_TWEETS)
      @tweets = Array(tweets)
    end

    # set enabled true (for Randomtweet file dsl)
    def enable
      @enable = true
    end

    # set enabled false (for Randomtweet file dsl)
    def disable
      @enable = false
    end

    # setup_frequency (for Randomtweet file dsl)
    def setup_frequency(frequency = DEFAULT_FREQUENCY)
      @frequency = Integer(frequency)
    end

    def enable?
      @enable
    end

    def disable?
      !@enable
    end

    def tweet_this_time?
      frequency >= rand(100)
    end

    def tweet
      @tweets.sample[0..99][0..140]
    end
  end
end
