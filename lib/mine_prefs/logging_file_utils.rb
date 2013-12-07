module MinePrefs
  class LoggingFileUtils
    attr_reader :file_utils

    def initialize(file_utils)
      @file_utils = file_utils
    end

    def symlink(source, target)
      puts "Symlinking #{source} to #{target}"
      file_utils.symlink source, target
    end

    def rm(file)
      puts "Removing #{file}"
      file_utils.rm file
    end

    def mv(source, target, options={})
      puts "Moving #{source} to #{target}"
      file_utils.mv source, target, options
    end
  end
end
