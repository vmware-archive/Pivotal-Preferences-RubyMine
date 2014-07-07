module MinePrefs
  module Domain
    module Commands
      class CreateDirectories
        def initialize(filesystem: MinePrefs::Domain::FileUtils.new, preferences: [])
          @filesystem = filesystem
          @preferences = preferences
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
          :preferences,
        )

        def assumed_dirs
          preferences.directories_assumed_to_exist_in_target
        end
      end
    end
  end
end
