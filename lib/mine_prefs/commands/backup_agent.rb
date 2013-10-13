module MinePrefs
  module Commands
    class BackupAgent
      attr_reader :filesystem

      def initialize(filesystem: FileUtils)
        @filesystem = filesystem
      end

      def execute(installation_bundle)
        installation_bundle.target_files.each do |target_file|
          begin
            filesystem.mv(target_file, "#{target_file}.bak", force: true)
          rescue Errno::ENOENT
          end
        end
      end
    end
  end
end
