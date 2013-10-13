module MinePrefs
  class Symlinker
    def initialize(filesystem: FileUtils)
      @filesystem = filesystem
    end

    def install(installation)
      installation.files_to_install.each do |file_to_install|
        filesystem.symlink(File.join(installation.source_location, file_to_install), File.join(installation.target, file_to_install))
      end
    end

    private
    attr_reader :filesystem
  end
end
