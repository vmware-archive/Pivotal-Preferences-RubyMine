module Spec
  module Support
    module Mocks
      class PreferenceStub
        attr_reader :target

        def initialize(target: nil)
          @target = target
        end
      end
    end
  end
end
