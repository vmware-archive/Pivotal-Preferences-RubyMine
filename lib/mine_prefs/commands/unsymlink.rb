module MinePrefs
  module Commands
    class Unsymlink
      def initialize(filesystem: FileUtils)
        @filesystem = filesystem
      end

      def execute(installation_bundle)
        installation_bundle.target_files.each do |target_file|
          filesystem.rm target_file
        end
      end

      private
      attr_reader :filesystem
    end
  end
end
