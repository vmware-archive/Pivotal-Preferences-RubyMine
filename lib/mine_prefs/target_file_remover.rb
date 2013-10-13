module MinePrefs
  class TargetFileRemover
    attr_reader :filesystem

    def initialize(filesystem: FileUtils)
      @filesystem = filesystem
    end

    def execute(installation_bundle)
      installation_bundle.files_to_install.each do |file_to_install|
        begin
          filesystem.rm_rf(File.join(installation_bundle.target, file_to_install))
        rescue Errno::ENOENT
        end
      end
    end
  end
end

