module MinePrefs
  module Domain
    module Commands
      class Command
        def failed_validations
          validations.reject(&:valid?)
        end

        def validations
          []
        end

        def valid?
          failed_validations.empty?
        end

        def invalid?
          !valid?
        end
      end
    end
  end
end
