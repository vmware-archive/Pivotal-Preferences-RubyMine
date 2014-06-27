module MinePrefs
  module Commands
    class CreateDirectories
      def initialize(filesystem: MinePrefs::FileUtils.new)
        @filesystem = filesystem
      end

      def execute(files_to_install)
        @filesystem.mkdir_p("#{files_to_install.target_location}/options")
      end

      def undo

      end

      private
      attr_reader :filesystem
    end
  end
end
