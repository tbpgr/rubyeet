# encoding: utf-8
require "spec_helper"
require "rubyeet/brains/memory"

describe Rubyeet::Brains::Memory do
  context :data do
    cases = [
      {
        case_no: 1,
        case_title: "default data",
        expected: {}
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          rubyeet_brains_memory = Rubyeet::Brains::Memory.new

          # -- when --
          actual = rubyeet_brains_memory.data

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
