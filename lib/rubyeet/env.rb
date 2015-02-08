module Rubyeet
  class Env
    attr_reader :key, :description, :optional

    def initialize(key, description, optional = false)
      @key = key.to_s
      @description = description
      @optional = optional
    end

    def validate
      error if required? && missing?
    end

    def usage
      "    %-30s - %s" % [key, description]
    end

    private

    def required?
      !optional
    end

    def missing?
      !ENV[key]
    end

    def error
      fail MissingRequiredKeyError, %(ENV["#{key}"] is required but missing)
    end
  end
end
