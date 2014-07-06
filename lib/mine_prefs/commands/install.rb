require "mine_prefs/commands/create_directories"
require "mine_prefs/commands/backup"
require "mine_prefs/commands/symlink"

module MinePrefs
  module Commands
    def self.Install(preferences: [])
      Script.new(commands: [
        MinePrefs::Commands::CreateDirectories.new(files_to_install: preferences),
        MinePrefs::Commands::Backup.new(files_to_install: preferences),
        MinePrefs::Commands::Symlink.new(files_to_install: preferences),
      ])
    end
  end
end
