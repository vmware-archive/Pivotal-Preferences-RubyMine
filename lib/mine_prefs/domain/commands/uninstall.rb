require "mine_prefs/domain/commands/remove_symlink"
require "mine_prefs/domain/commands/restore"
require "mine_prefs/domain/commands/remove_empty_directories"

module MinePrefs
  module Domain
    module Commands
      def self.Uninstall(preferences: [])
        Script.new(commands: [
          MinePrefs::Domain::Commands::RemoveSymlink.new(files_to_install: preferences),
          MinePrefs::Domain::Commands::Restore.new(files_to_install: preferences),
          MinePrefs::Domain::Commands::RemoveEmptyDirectories.new(files_to_install: preferences),
        ])
      end
    end
  end
end
