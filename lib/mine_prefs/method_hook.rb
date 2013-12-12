module MinePrefs
  class MethodHook
    def initialize(klass: nil, method_name: nil, before: ->(*) {}, after: ->(*) {})
      klass.class_eval do
        define_method "#{method_name}_with_logging" do |*args|
          before.call *args
          result = send "#{method_name}_without_logging", *args
          after.call *args, result
        end

        alias_method "#{method_name}_without_logging", method_name
        alias_method method_name, "#{method_name}_with_logging"
      end
    end
  end
end
