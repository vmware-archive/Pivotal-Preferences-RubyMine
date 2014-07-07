module MinePrefs
  module Domain
    class MethodHook
      def initialize(klass: nil, method_name: nil, before: ->(*) {}, after: ->(*) {})
        klass.class_eval do
          define_method "#{method_name}_with_method_hook" do |*args|
            before.call *args
            result = send "#{method_name}_without_method_hook", *args
            after.call *args, result
          end

          alias_method "#{method_name}_without_method_hook", method_name
          alias_method method_name, "#{method_name}_with_method_hook"
        end
      end
    end
  end
end
