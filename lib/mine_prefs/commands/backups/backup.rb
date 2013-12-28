module MinePrefs
  module Commands
    module Backups
      class Backup
        attr_reader :filesystem

        def initialize(filesystem: MinePrefs::FileUtils.new)
          @filesystem = filesystem
        end

        def execute(files_to_install)
          files_to_install.each do |file|
            source = file.target
            destination = MinePrefs::Commands::Backups::BackupPathname.new(source)

            filesystem.mv(source, destination)
          end
        end

        def undo(files_to_install)
          files_to_install.each do |file|
            destination = file.target
            source = MinePrefs::Commands::Backups::BackupPathname.new(destination)

            filesystem.mv(source, destination)
          end
        end
      end
    end
  end
end
