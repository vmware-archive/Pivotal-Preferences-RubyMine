module MinePrefs
  module Domain
    module Commands
      class CreateDirectories
        def initialize(filesystem: MinePrefs::Domain::FileUtils.new, files_to_install: [])
          @filesystem = filesystem
          @files_to_install = files_to_install
        end

        def validations
          []
        end

        def execute
          assumed_dirs.each do |target_dir|
            filesystem.mkdir_p(target_dir)
          end
        end

        def undo
          assumed_dirs.reverse.each do |target_dir|
            filesystem.rmdir(target_dir)
          end
        end

        private
        attr_reader(
          :filesystem,
          :files_to_install,
        )

        def assumed_dirs
          files_to_install.directories_assumed_to_exist_in_target
        end
      end
    end
  end
end
