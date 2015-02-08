# encoding: utf-8
require "spec_helper"
require "rubyeet/brains/base"

describe Rubyeet::Brains::Base do
  module Rubyeet
    module Brains
      class SampleChild1 < Base
        def data
        end
      end
    end
  end

  module Rubyeet
    module Brains
      class SampleChild2 < Base
        def data
          @data ||= {}
        end
      end
    end
  end

  context :inherited do
    cases = [
      {
        case_no: 1,
        case_title: "inherit"
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = Rubyeet::Brains::Base.brain_classes

          # -- then --
          expect(actual).to eq([Rubyeet::Brains::SampleChild1, Rubyeet::Brains::SampleChild2])
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

  context :klass do
    cases = [
      {
        case_no: 1,
        case_title: "get last brain child"
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = Rubyeet::Brains::Base.klass

          # -- then --
          expect(actual).to eq(Rubyeet::Brains::SampleChild2)
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
