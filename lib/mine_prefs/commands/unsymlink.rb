module MinePrefs
  module Commands
    class Unsymlink
      def initialize(filesystem: FileUtils)
        @filesystem = filesystem
      end

      def execute(installation_bundle)
        installation_bundle.each do |file|
          filesystem.rm file.target
        end
      end

      private
      attr_reader :filesystem
    end
  end
end
