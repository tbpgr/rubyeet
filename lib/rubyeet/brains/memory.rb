# encoding: utf-8

module Rubyeet::Brains
  class Memory < Base
    def data
      @data ||= {}
    end
  end
end
