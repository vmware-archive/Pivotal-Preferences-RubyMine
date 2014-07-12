require "mine_prefs/domain/commands/command"

module MinePrefs
  module Domain
    module Commands
      class RemoveSymlink < Command
        def initialize(filesystem: MinePrefs::Domain::FileUtils.new, preferences: [])
          @filesystem = filesystem
          @preferences = preferences
        end

        def validations
          [PreferencesMustBeInstalled.new(preferences: preferences, filesystem: filesystem)]
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

        class PreferencesMustBeInstalled
          def initialize(filesystem: nil, preferences: nil)
            @filesystem = filesystem
            @preferences = preferences
          end

          def valid?
            preferences.all? { |p| filesystem.symlink?(p.target) }
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
end
