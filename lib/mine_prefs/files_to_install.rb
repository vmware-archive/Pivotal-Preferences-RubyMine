module MinePrefs
  class FilesToInstall
    include Enumerable

    attr_reader :target_location, :source_location, :files_or_directories_to_install

    def initialize(target_location: nil, source_location: nil, files_or_directories_to_install: nil)
      @target_location = target_location
      @source_location = source_location
      @files_or_directories_to_install = files_or_directories_to_install
    end

    def each(&block)
      installable_files.each &block
    end

    private
    def installable_files
      files_or_directories_to_install.map do |file_to_install|
        InstallableFile.new(
          source: File.expand_path(File.join(source_location, file_to_install)),
          target: File.expand_path(File.join(target_location, file_to_install)),
        )
      end
    end

    class InstallableFile
      attr_reader :source, :target

      def initialize(source: nil, target: nil)
        @source = source
        @target = target
      end
    end
  end
end
