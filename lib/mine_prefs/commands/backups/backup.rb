module MinePrefs
  module Commands
    module Backups
      class Backup
        attr_reader :filesystem

        def initialize(filesystem: FileUtils)
          @filesystem = filesystem
        end

        def execute(installation_bundle)
          installation_bundle.each do |file|
            begin
              filesystem.mv(file.target, MinePrefs::Commands::Backups::File.new(file.target).to_s, force: true)
            rescue Errno::ENOENT
            end
          end
        end
      end
    end
  end
end
