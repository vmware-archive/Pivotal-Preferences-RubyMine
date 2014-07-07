module MinePrefs
  module Domain
    class FileUtils
      attr_reader :file_utils

      def initialize(file_utils=::FileUtils)
        @file_utils = file_utils
      end

      SOURCE_FILE_NOT_FOUND = Errno::ENOENT

      def mv(source, target)
        begin
          file_utils.mv source.to_s, target.to_s, force: true
        rescue SOURCE_FILE_NOT_FOUND
        end
      end

      def symlink(source, target)
        file_utils.symlink source, target
      end

      def rm(path)
        file_utils.rm path
      end

      def mkdir_p(path)
        file_utils.mkdir_p path
      end

      def rmdir(path)
        file_utils.rmdir path
      end
    end
  end
end
