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

            filesystem.should_receive(:mv) do |backup_file_name, target_file_name|
              backup_file_name.should == "/target/file.bak"
              target_file_name.should == "/target/file"
            end

            Backup.new(filesystem: filesystem).undo(installation_bundle)
          end
        end

        describe "#execute" do
          it "backs up the target file anyways, overwriting the original execute file" do
            installation = [double(:file, target: "/bar/foo")]

            filesystem = double :filesystem

            filesystem.should_receive(:mv) do |target_file_name, backup_file_name|
              target_file_name.should == "/bar/foo"
              backup_file_name.should == "/bar/foo.bak"
            end

            Backup.new(filesystem: filesystem).execute(installation)
          end
        end
      end
    end
  end
end
