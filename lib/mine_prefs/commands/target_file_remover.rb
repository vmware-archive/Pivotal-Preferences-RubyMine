module MinePrefs
  module Commands
    class TargetFileRemover
      attr_reader :filesystem

      def initialize(filesystem: FileUtils)
        @filesystem = filesystem
      end

      def execute(installation_bundle)
        installation_bundle.target_files.each do |target_file|
          begin
            filesystem.rm_rf(target_file)
          rescue Errno::ENOENT
          end
        end
      end
    end
  end
end

