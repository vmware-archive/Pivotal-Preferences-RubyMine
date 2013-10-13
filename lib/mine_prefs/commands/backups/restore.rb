module MinePrefs
  module Commands
    module Backups
      class Restore
        def initialize(filesystem: FileUtils)
          @filesystem = filesystem
        end

        def execute(installation_bundle)
          installation_bundle.target_files.each do |target_file|
            begin
              filesystem.mv(MinePrefs::Commands::Backups::File.new(target_file).to_s, target_file)
            rescue Errno::ENOENT
            end
          end
        end

        private
        attr_reader :filesystem
      end
    end
  end
end
