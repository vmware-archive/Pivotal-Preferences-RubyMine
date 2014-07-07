require "mine_prefs/domain/execute"
require "mine_prefs/domain/commands/install"

module MinePrefs
  module Cli
    module Actions
      class InstallAction
        def initialize(preferences: nil)
          @preferences = preferences
        end

        def execute
          MinePrefs::Domain::Execute(
            command: MinePrefs::Domain::Commands::Install(preferences: preferences),
            observer: self,
          )
        end

        def command_succeeded(*)
          puts "\nInstallation complete!"
        end

        attr_reader :preferences
      end
    end
  end
end
