module MinePrefs
  module Commands
    module Backups
      class Backup
        attr_reader :filesystem

        def initialize(filesystem: LoggingFileUtils.new(FileUtils))
          @filesystem = filesystem
        end

        FILE_NOT_FOUND = Errno::ENOENT

        def execute(installation_bundle)
          installation_bundle.each do |file|
            begin
              filesystem.mv(file.target, MinePrefs::Commands::Backups::File.new(file.target).to_s, force: true)
            rescue FILE_NOT_FOUND
            end
          end
        end

        def undo(installation_bundle)
          installation_bundle.each do |file|
            begin
              filesystem.mv(MinePrefs::Commands::Backups::File.new(file.target).to_s, file.target)
            rescue FILE_NOT_FOUND
            end
          end
        end
      end
    end
  end
end
