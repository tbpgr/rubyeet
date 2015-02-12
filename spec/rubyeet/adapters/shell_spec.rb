# encoding: utf-8
require "spec_helper"
require "rubyeet"

describe Rubyeet::Adapters::Shell do
  let(:robot) do
    Rubyeet::Bot.new
  end

  context :run do
    cases = [
      {
        case_no: 1,
        case_title: "case exit",
        input: 'exit',
        stop: true
      },
      {
        case_no: 2,
        case_title: "case quit",
        input: 'quit',
        stop: true
      },
      {
        case_no: 3,
        case_title: "case other",
        input: 'other',
        stop: false
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          rubyeet_adapters_shell = Rubyeet::Adapters::Shell.new(robot)
          if c[:stop]
            Readline.stub(readline: c[:input])
            rubyeet_adapters_shell.should_receive(:stop).and_call_original
          else
            Readline.stub(:readline).and_return(c[:input], "exit")
            robot.should_receive(:receive).with(body: c[:input], source: Rubyeet::Adapters::Shell::SOURCE)
          end

          # -- when & then --
          rubyeet_adapters_shell.run
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

  context :say do
    cases = [
      {
        case_no: 1,
        case_title: "valid case",
        input: "message"
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          rubyeet_adapters_shell = Rubyeet::Adapters::Shell.new(robot)
          Rubyeet.logger.should_receive(:info).with(c[:input])

          # -- when & then --
          rubyeet_adapters_shell.say(body: c[:input])
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

  context :random_tweet do
    cases = [
      {
        case_no: 1,
        case_title: "valid case",
        input: "test",
        expected: /(tweet1|tweet2|tweet3)/
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          rubyeet_adapters_shell = Rubyeet::Adapters::Shell.new
          Rubyeet::Twitter::RandomTweet.any_instance.stub(:tweet_this_time?)
                                       .and_return(true)
          Rubyeet.logger.should_receive(:info).with(anything()).twice

          # -- when & then --
          rubyeet_adapters_shell.send(:random_tweet, c[:input])
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
