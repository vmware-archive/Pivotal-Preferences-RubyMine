require "mine_prefs/values/backup_pathname"

module MinePrefs
  module Commands
    class Restore
      def initialize(filesystem: MinePrefs::FileUtils.new, files_to_install: [])
        @filesystem = filesystem
        @files_to_install = files_to_install
      end

      def execute
        files_to_install.each do |file|
          destination = file.target
          source = Values::BackupPathname.new(destination)

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
