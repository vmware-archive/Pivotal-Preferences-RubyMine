module Spec
  module Support
    module Mocks
      class CommandSpy
        def execute
          @executed = true
        end

        def has_executed?
          @executed
        end
      end
    end
  end
end
