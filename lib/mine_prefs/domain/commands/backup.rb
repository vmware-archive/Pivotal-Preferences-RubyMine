require "mine_prefs/domain/values/backup_pathname"

module MinePrefs
  module Domain
    module Commands
      class Backup
        def initialize(filesystem: MinePrefs::Domain::FileUtils.new, preferences: [])
          @filesystem = filesystem
          @preferences = preferences
        end

        def validations
          []
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
