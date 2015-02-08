module Rubyeet
  module Adapters
    class Base
      include Env::Validatable

      class << self
        def inherited(child)
          Rubyeet::AdapterBuilder.adapter_classes << child
        end
      end

      attr_reader :bot

      def initialize(bot)
        @bot = bot
        validate
      end
    end
  end
end
