module MinePrefs
  module Domain
    module Commands
      class Script
        def initialize(commands: [])
          @commands = commands
        end

        def failed_validations
          commands.collect(&:failed_validations).flatten
        end

        def execute
          commands.each &:execute
        end

        private
        attr_reader :commands
      end
    end
  end
end
