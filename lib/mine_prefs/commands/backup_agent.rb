module MinePrefs
  module Commands
    class BackupAgent
      attr_reader :filesystem

      def initialize(filesystem: FileUtils)
        @filesystem = filesystem
      end

      def execute(installation_bundle)
        installation_bundle.files_to_install.each do |file|
          target_file = File.join(installation_bundle.target, file)
          begin
            filesystem.mv(target_file, "#{target_file}.bak", force: true)
          rescue Errno::ENOENT
          end
        end
      end
    end
  end
end
