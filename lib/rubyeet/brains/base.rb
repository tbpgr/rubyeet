module Rubyeet
  module Brains
    class Base
      class << self
        def inherited(child)
          brain_classes << child
        end

        def klass
          brain_classes.last
        end

        def brain_classes
          @brain_classes ||= []
        end
      end
    end
  end
end
