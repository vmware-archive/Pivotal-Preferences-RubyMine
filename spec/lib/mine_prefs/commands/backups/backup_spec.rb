require "mine_prefs/commands/backups/backup"
require "mine_prefs/commands/backups/file"

module MinePrefs
  module Commands
    module Backups
      describe Backup do
        describe "#undo" do
          it "restores the back up files" do
            installation_bundle = [double(:file, target: "/target/file")]
            filesystem = double :filesystem

            filesystem.should_receive(:mv).with("/target/file.bak", "/target/file")

            Backup.new(filesystem: filesystem).undo(installation_bundle)
          end
        end

        describe "#execute" do
          it "backs up the target file anyways, overwriting the original execute file" do
            installation = [double(:file, target: "/bar/foo")]

            filesystem = double :filesystem

            filesystem.should_receive(:mv).with("/bar/foo", "/bar/foo.bak")

            Backup.new(filesystem: filesystem).execute(installation)
          end
        end
      end
    end
  end
end
