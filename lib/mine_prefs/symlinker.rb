module MinePrefs
  class Symlinker
    def initialize(filesystem: FileUtils)
      @filesystem = filesystem
    end

    def execute(installation_bundle)
      installation_bundle.files_to_install.each do |file_to_install|
        filesystem.symlink(
          File.join(
            installation_bundle.source_location, file_to_install
          ),
          File.join(installation_bundle.target, file_to_install)
        )
      end
    end

    private
    attr_reader :filesystem
  end
end
