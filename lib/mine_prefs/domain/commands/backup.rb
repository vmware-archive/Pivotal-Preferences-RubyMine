require "mine_prefs/domain/values/backup_pathname"
require "mine_prefs/domain/commands/command"

module MinePrefs
  module Domain
    module Commands
      class Backup < Command
        def initialize(filesystem: MinePrefs::Domain::FileUtils.new, preferences: [])
          @filesystem = filesystem
          @preferences = preferences
        end

        def execute
          preferences.each do |file|
            source = file.target
            destination = Values::BackupPathname.new(source)

            filesystem.mv(source, destination)
          end
        end

        private
        attr_reader(
          :preferences,
          :filesystem,
        )
      end
    end
  end
end
