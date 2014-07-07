require "mine_prefs/domain/commands/create_directories"
require "mine_prefs/domain/commands/backup"
require "mine_prefs/domain/commands/symlink"

module MinePrefs
  module Domain
    module Commands
      def self.Install(preferences: [])
        Script.new(commands: [
          MinePrefs::Domain::Commands::CreateDirectories.new(files_to_install: preferences),
          MinePrefs::Domain::Commands::Backup.new(files_to_install: preferences),
          MinePrefs::Domain::Commands::Symlink.new(files_to_install: preferences),
        ])
      end
    end
  end
end
