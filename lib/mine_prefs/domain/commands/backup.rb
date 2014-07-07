require "mine_prefs/domain/values/backup_pathname"

module MinePrefs
  module Domain
    module Commands
      class Backup
        def initialize(filesystem: MinePrefs::Domain::FileUtils.new, files_to_install: [])
          @filesystem = filesystem
          @files_to_install = files_to_install
        end

        def validations
          []
        end

        def execute
          files_to_install.each do |file|
            source = file.target
            destination = Values::BackupPathname.new(source)

            filesystem.mv(source, destination)
          end
        end

        private
        attr_reader(
          :files_to_install,
          :filesystem,
        )
      end
    end
  end
end
