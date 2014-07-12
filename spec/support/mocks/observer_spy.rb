module Spec
  module Support
    module Mocks
      class ObserverSpy
        def command_succeeded(*)
          @success = true
        end

        def validations_failed(failed_validations)
          @failed_validations = failed_validations
        end

        def has_observed_success?
          @success
        end

        def has_observed_failed_validations?(failed_validations)
          @failed_validations == failed_validations
        end
      end
    end
  end
end
