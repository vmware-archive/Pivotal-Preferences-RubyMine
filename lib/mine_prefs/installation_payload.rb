module MinePrefs
  class InstallationPayload
    include Enumerable

    attr_reader :target_location, :source_location, :files_to_install

    def initialize(target_location: nil, source_location: nil, files_to_install: nil)
      @target_location = target_location
      @source_location = source_location
      @files_to_install = files_to_install
    end

    def target_files
      files_to_install.map do |file_to_install|
        File.join(target_location, file_to_install)
      end
    end

    def each(&block)
      installation_pairs.each &block
    end

    private
    def installation_pairs
      files_to_install.map do |file_to_install|
        InstallationPair.new(
          source: File.join(source_location, file_to_install),
          target: File.join(target_location, file_to_install),
        )
      end
    end

    class InstallationPair
      attr_reader :source, :target

      def initialize(source: nil, target: nil)
        @source = source
        @target = target
      end
    end
  end
end
