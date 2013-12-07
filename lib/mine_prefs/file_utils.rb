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
        file_utils.mv source, target, force: true
      rescue SOURCE_FILE_NOT_FOUND
      end
    end
  end
end
