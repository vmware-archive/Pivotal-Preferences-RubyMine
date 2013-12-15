module MinePrefs
  module Commands
    class Symlink
      def initialize(filesystem: MinePrefs::FileUtils.new)
        @filesystem = filesystem
      end

      def execute(files_to_install)
        files_to_install.each do |installable_file|
          filesystem.symlink(installable_file.source, installable_file.target)
        end
      end

      def undo(files_to_install)
        files_to_install.each do |installable_file|
          filesystem.rm(installable_file.target)
        end
      end

      private
      attr_reader :filesystem
    end
  end
end
