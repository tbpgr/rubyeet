module Rubyeet
  class Env
    module Validatable
      def self.included(klazz)
        klazz.extend(ClassMethods)
      end

      module ClassMethods
        def envs
          @envs ||= []
        end

        def env(key, description, optional = false)
          envs << Env.new(key, description, optional)
        end

        def usage
          envs.map(&:usage).join("\n")
        end
      end

      def validate
        self.class.envs.each(&:validate)
      rescue MissingRequiredKeyError => exception
        raise ValidationError, "#{exception}\n#{self.class.usage}"
      end

      def validate!
        validate
      rescue ValidationError => exception
        Rubyeet.die(exception)
      end
    end
  end
end
