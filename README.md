# [WIP] Rubyeet

Work In Progress

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubyeet'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rubyeet

## Usage

TODO: Write usage instructions here

## SettingFiles
### Randomtweet

|key|args|memo|
|:--|:--|
|enable|--|enable random tweet|
|disable|--|disable random tweet|
|setup_frequency|frequency|set random frequency 1-100 (%). default = 10|
|setup_tweets|tweets|set random tweets (String Array)|

* Sample

~~~ruby
enable
# disalbe
setup_frequency 20
setup_tweets %w(tweet1 tweet2 tweet3)
~~~

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rubyeet/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## MEMO


### RandomTweet 設計メモ
Runtime

Ruboty::Bot
   setup RandomTweet

Ruboty::SomeAdapter#run
   next if RandomTweet#disable?
   next unless RandomTweet#tweet_this_time?
   RandomTweet#tweet

### Adapter 設計メモ

Adapter
  run

  def listen
    timeline.each do |tl|
      random_tweet
      # TODO: simple_response
      # TODO: custom_response
      # TODO: retweet
      # TODO: favorite
    end
  end
