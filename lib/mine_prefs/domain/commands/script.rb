require "mine_prefs/domain/commands/command"

module MinePrefs
  module Domain
    module Commands
      class Script < Command
        def initialize(commands: [])
          @commands = commands
        end

        def validations
          commands.collect(&:validations).flatten
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
