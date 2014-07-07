module MinePrefs
  module Domain
    module Commands
      class Symlink
        def initialize(filesystem: MinePrefs::Domain::FileUtils.new, files_to_install: files_to_install)
          @filesystem = filesystem
          @files_to_install = files_to_install
        end

        def validations
          []
        end

        def execute
          files_to_install.each do |installable_file|
            filesystem.symlink(installable_file.source, installable_file.target)
          end
        end

        def undo
          files_to_install.each do |installable_file|
            filesystem.rm(installable_file.target)
          end
        end

        private
        attr_reader(
          :filesystem,
          :files_to_install,
        )
      end
    end
  end
end
