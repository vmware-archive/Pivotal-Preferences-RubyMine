require "mine_prefs/domain/values/backup_pathname"
require "mine_prefs/domain/commands/command"

module MinePrefs
  module Domain
    module Commands
      class Restore < Command
        def initialize(filesystem: MinePrefs::Domain::FileUtils.new, preferences: [])
          @filesystem = filesystem
          @preferences = preferences
        end

        def execute
          preferences.each do |file|
            destination = file.target
            source = Values::BackupPathname.new(destination)

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
