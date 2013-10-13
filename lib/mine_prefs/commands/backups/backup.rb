module MinePrefs
  module Commands
    module Backups
      class Backup
        attr_reader :filesystem

        def initialize(filesystem: FileUtils)
          @filesystem = filesystem
        end

        def execute(installation_bundle)
          installation_bundle.target_files.each do |target_file|
            begin
              filesystem.mv(target_file, MinePrefs::Commands::Backups::File.new(target_file).to_s, force: true)
            rescue Errno::ENOENT
            end
          end
        end
      end
    end
  end
end
