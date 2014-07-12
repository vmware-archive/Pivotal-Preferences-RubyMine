require "mine_prefs/domain/commands/command"

module MinePrefs
  module Domain
    module Commands
      class Symlink < Command
        def initialize(filesystem: MinePrefs::Domain::FileUtils.new, preferences: preferences)
          @filesystem = filesystem
          @preferences = preferences
        end

        def validations
          [SymlinkNotPresent.new(preferences: preferences, filesystem: filesystem)]
        end

        def execute
          preferences.each do |installable_file|
            filesystem.symlink(installable_file.source, installable_file.target)
          end
        end

        private
        attr_reader(
          :filesystem,
          :preferences,
        )

        class SymlinkNotPresent
          def initialize(filesystem: nil, preferences: nil)
            @filesystem = filesystem
            @preferences = preferences
          end

          def valid?
            preferences.none? do |preference|
              filesystem.symlink?(preference.target)
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
end
