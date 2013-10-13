module MinePrefs
  class BackupAgent
    attr_reader :filesystem

    def initialize(filesystem: FileUtils)
      @filesystem = filesystem
    end

    def prepare_installation(installation)
      installation.files_to_install.each do |file|
        target_file = File.join(installation.target, file)
        filesystem.mv(target_file, "#{target_file}.bak")
      end
    end
  end
end
