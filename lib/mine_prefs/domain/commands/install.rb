require "mine_prefs/domain/commands/create_directories"
require "mine_prefs/domain/commands/backup"
require "mine_prefs/domain/commands/symlink"

module MinePrefs
  module Domain
    module Commands
      def self.Install(preferences: [])
        Script.new(commands: [
          MinePrefs::Domain::Commands::CreateDirectories.new(preferences: preferences),
          MinePrefs::Domain::Commands::Backup.new(preferences: preferences),
          MinePrefs::Domain::Commands::Symlink.new(preferences: preferences),
        ])
      end
    end
  end
end
