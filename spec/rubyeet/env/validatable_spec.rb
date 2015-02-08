# encoding: utf-8
require "spec_helper"
require "rubyeet/env/validatable"

describe Rubyeet::Env::Validatable do
  context :envs do
    let(:env_hoge) do
      Rubyeet::Env.new(:HOGE, "description of HOGE")
    end

    let(:env_hige) do
      Rubyeet::Env.new(:HIGE, "description of HIGE", true)
    end

    let(:validatable_class) do
      Class.new do
        include Rubyeet::Env::Validatable

        env :HOGE, "description of HOGE"
        env :HIGE, "description of HIGE", true
      end
    end

    let(:instance) do
      validatable_class.new
    end

    let(:expected_envs) do
      [env_hoge, env_hige]
    end

    cases = [
      {
        case_no: 1,
        case_title: "HOGE, HIGE envs case"
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = validatable_class.envs

          # -- then --
          expect(actual)  == expected_envs
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

  context :usage do
    let(:env_hoge) do
      Rubyeet::Env.new(:HOGE, "description of HOGE")
    end

    let(:env_hige) do
      Rubyeet::Env.new(:HIGE, "description of HIGE", true)
    end

    let(:validatable_class) do
      Class.new do
        include Rubyeet::Env::Validatable

        env :HOGE, "description of HOGE"
        env :HIGE, "description of HIGE", true
      end
    end

    cases = [
      {
        case_no: 1,
        case_title: "HOGE, HIGE envs case",
        expected: <<-EOS
    HOGE                           - description of HOGE
    HIGE                           - description of HIGE
        EOS
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = validatable_class.usage

          # -- then --
          expect(actual).to eq(c[:expected].chomp)
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

  context :validate do
   let(:env_hoge) do
      Rubyeet::Env.new(:HOGE, "description of HOGE")
    end

    let(:env_hige) do
      Rubyeet::Env.new(:HIGE, "description of HIGE", true)
    end

    let(:validatable_class) do
      Class.new do
        include Rubyeet::Env::Validatable

        env :HOGE, "description of HOGE"
        env :HIGE, "description of HIGE", true
      end
    end

    let(:instance) do
      validatable_class.new
    end

    let(:expected_envs) do
      [env_hoge, env_hige]
    end

    cases = [
      {
        case_no: 1,
        case_title: "no error",
        envs: [:HOGE, :HIGE],
        error: false
      },
      {
        case_no: 2,
        case_title: "has error",
        envs: [:HIGE],
        error: true
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          c[:envs].each do |env|
            ENV[env.to_s] = 'dummy'
          end

          # -- when, then --
          if (c[:error])
            expect { instance.validate }.to raise_error(Rubyeet::Env::ValidationError)
          else
            instance.validate
          end
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
        ENV['HOGE'] = nil
        ENV['HIGE'] = nil
      end

      def case_after(c)
        # implement each case after
      end
    end
  end

  context :validate! do
    let(:env_hoge) do
       Rubyeet::Env.new(:HOGE, "description of HOGE")
     end

     let(:env_hige) do
       Rubyeet::Env.new(:HIGE, "description of HIGE", true)
     end

     let(:validatable_class) do
       Class.new do
         include Rubyeet::Env::Validatable

         env :HOGE, "description of HOGE"
         env :HIGE, "description of HIGE", true
       end
     end

     let(:instance) do
       validatable_class.new
     end

    cases = [
      {
        case_no: 1,
        case_title: "error exit",
        expected: <<-EOS
Error: ENV["HOGE"] is required but missing
    HOGE                           - description of HOGE
    HIGE                           - description of HIGE
        EOS
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          Rubyeet.logger.should_receive(:error).with(c[:expected].chomp)
          Rubyeet.should_receive(:exit)

          # -- when, then --
          instance.validate!
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
