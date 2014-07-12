module Spec
  module Support
    module Mocks
      class CommandStub
        attr_reader :failed_validations

        def initialize(failed_validations: nil)
          @failed_validations = failed_validations
        end
      end
    end
  end
end
