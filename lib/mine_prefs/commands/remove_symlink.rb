module MinePrefs
  module Commands
    class RemoveSymlink
      def initialize(filesystem: MinePrefs::FileUtils.new, files_to_install: files_to_install)
        @filesystem = filesystem
        @files_to_install = files_to_install
      end

      def execute
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
