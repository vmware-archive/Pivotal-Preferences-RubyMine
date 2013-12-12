require "delegate"

module MinePrefs
  class FileUtils < SimpleDelegator
    attr_reader :file_utils

    def initialize(file_utils=::FileUtils)
      @file_utils = file_utils
      super
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
  end
end
