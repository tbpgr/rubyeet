# encoding: utf-8
require "spec_helper"
require "rubyeet/adapter_builder"

describe Rubyeet::AdapterBuilder do
  context :adapter_classes do
    cases = [
      {
        case_no: 1,
        case_title: "valid case",
        klasses: [Fixnum, String],
        expected: [Rubyeet::Adapters::Shell, Fixnum, String]
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          c[:klasses].each { |e|Rubyeet::AdapterBuilder.adapter_classes << e }
          rubyeet_adapter_builder = Rubyeet::AdapterBuilder.new(:dummy)

          # -- when --
          actual = Rubyeet::AdapterBuilder.adapter_classes

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

  context :initialize do
    cases = [
      {
        case_no: 1,
        case_title: "valid case",
        bot: :dummy,
        expected: :dummy
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          instance = Rubyeet::AdapterBuilder.new(c[:bot])
          actual = instance.bot

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

  context :build! do
    cases = [
      {
        case_no: 1,
        case_title: "valid case",
        klasses: [Fixnum, String],
        bot: 'dummy',
        expected: 'dummy'
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          c[:klasses].each { |e|Rubyeet::AdapterBuilder.adapter_classes << e }
          rubyeet_adapter_builder = Rubyeet::AdapterBuilder.new(c[:bot])

          # -- when --
          actual = rubyeet_adapter_builder.build

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
end
