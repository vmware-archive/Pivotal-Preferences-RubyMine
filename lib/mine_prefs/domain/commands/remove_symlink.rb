module MinePrefs
  module Domain
    module Commands
      class RemoveSymlink
        def initialize(filesystem: MinePrefs::Domain::FileUtils.new, preferences: preferences)
          @filesystem = filesystem
          @preferences = preferences
        end

        def failed_validations
          []
        end

        def execute
          preferences.each do |installable_file|
            filesystem.rm(installable_file.target)
          end
        end

        private
        attr_reader(
          :filesystem,
          :preferences,
        )
      end
    end
  end
end
