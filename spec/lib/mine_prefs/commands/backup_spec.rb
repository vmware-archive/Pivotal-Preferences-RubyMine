require "mine_prefs/domain/commands/backup"
require "mine_prefs/domain/commands/restore"

module MinePrefs
  module Domain
    module Commands
      describe "backup and restore" do
        describe "Restore" do
          it "restores the back up files" do
            installation_bundle = [double(:file, target: "/target/file")]
            filesystem = double :filesystem

            filesystem.should_receive(:mv) do |backup_file_name, target_file_name|
              backup_file_name.should == "/target/file.bak"
              target_file_name.should == "/target/file"
            end

            Restore.new(
              filesystem: filesystem,
              preferences: installation_bundle,
            ).execute
          end
        end

        describe "Backup" do
          it "backs up the target file anyways, overwriting the original execute file" do
            installation = [double(:file, target: "/bar/foo")]

            filesystem = double :filesystem

            filesystem.should_receive(:mv) do |target_file_name, backup_file_name|
              target_file_name.should == "/bar/foo"
              backup_file_name.should == "/bar/foo.bak"
            end

            Backup.new(
              filesystem: filesystem,
              preferences: installation,
            ).execute
          end
        end
      end
    end
  end
end
