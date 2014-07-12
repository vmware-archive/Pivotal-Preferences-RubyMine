require "mine_prefs/domain/execute"
require "mine_prefs/domain/commands/uninstall"

module MinePrefs
  module Cli
    module Actions
      class UninstallAction
        def initialize(preferences: nil)
          @preferences = preferences
        end

        def execute
          MinePrefs::Domain::Execute(
            command: MinePrefs::Domain::Commands::Uninstall(preferences: preferences),
            observer: self,
          )
        end

        def command_succeeded(*)
          puts "\nUninstall complete!"
        end

        def validations_failed(*)
          puts "Doing nothing, it appears no preferences are installed."
        end

        private
        attr_reader :preferences
      end
    end
  end
end
