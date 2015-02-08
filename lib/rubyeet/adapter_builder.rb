module Rubyeet
  class AdapterBuilder
    def self.adapter_classes
      @adapter_classes ||= []
    end

    attr_reader :bot

    def initialize(bot)
      @bot = bot
    end

    def build
      last_adapter.new(bot)
    end

    private

    def last_adapter
      self.class.adapter_classes.last
    end
  end
end
