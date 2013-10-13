module MinePrefs
  class BackupAgent
    attr_reader :filesystem

    def initialize(filesystem: FileUtils)
      @filesystem = filesystem
    end

    def execute(installation)
      installation.files_to_install.each do |file|
        target_file = File.join(installation.target, file)
        begin
          filesystem.mv(target_file, "#{target_file}.bak", force: true)
        rescue Errno::ENOENT
        end
      end
    end
  end
end
