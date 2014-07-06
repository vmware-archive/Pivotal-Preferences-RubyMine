module MinePrefs
  module Commands
    class Backup
      attr_reader :filesystem

      def initialize(filesystem: MinePrefs::FileUtils.new)
        @filesystem = filesystem
      end

      def execute(files_to_install)
        files_to_install.each do |file|
          source = file.target
          destination = BackupPathname.new(source)

          filesystem.mv(source, destination)
        end
      end

      def undo(files_to_install)
        files_to_install.each do |file|
          destination = file.target
          source = BackupPathname.new(destination)

          filesystem.mv(source, destination)
        end
      end

      class BackupPathname
        def initialize(path)
          @path = path
        end

        def to_s
          "#{path}.bak"
        end

        def ==(string)
          to_s == string
        end

        private
        attr_reader :path
      end
    end
  end
end
