require "mine_prefs/commands/remove_symlink"
require "mine_prefs/commands/restore"
require "mine_prefs/commands/remove_empty_directories"

module MinePrefs
  module Commands
    def self.Uninstall(preferences: [])
      Script.new(commands: [
        MinePrefs::Commands::RemoveSymlink.new(files_to_install: preferences),
        MinePrefs::Commands::Restore.new(files_to_install: preferences),
        MinePrefs::Commands::RemoveEmptyDirectories.new(files_to_install: preferences),
      ])
    end
  end
end
