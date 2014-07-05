module MinePrefs
  module Commands
    class CreateDirectories
      def initialize(filesystem: MinePrefs::FileUtils.new)
        @filesystem = filesystem
      end

      def execute(files_to_install)
        assumed_dirs(files_to_install).each do |target_dir|
          filesystem.mkdir_p(target_dir)
        end
      end

      def undo(files_to_install)
        assumed_dirs(files_to_install).reverse.each do |target_dir|
          filesystem.rmdir(target_dir)
        end
      end

      private
      attr_reader :filesystem

      def assumed_dirs(files_to_install)
        files_to_install.directories_assumed_to_exist_in_target
      end
    end
  end
end
