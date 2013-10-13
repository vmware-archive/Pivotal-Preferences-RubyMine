require "mine_prefs/commands/backups/restore"
require "mine_prefs/commands/backups/file"

module MinePrefs
  module Commands
    module Backups
      describe Restore do
        describe "#execute" do
          context "backup files exist" do
            it "copies the backup files over" do
              installation_bundle = double :installation_bundle, target_files: ["/target/file"]
              filesystem = double :filesystem

              filesystem.should_receive(:mv).with("/target/file.bak", "/target/file")

              Restore.new(filesystem: filesystem).execute(installation_bundle)
            end
          end

          context "backup files do not exist" do
            it "silently passes over them" do
              installation_bundle = double :installation_bundle, target_files: ["/target/file"]
              filesystem = double :filesystem

              filesystem.stub(:mv).with("/target/file.bak", "/target/file").and_raise Errno::ENOENT

              expect {
                Restore.new(filesystem: filesystem).execute(installation_bundle)
              }.to_not raise_exception
            end
          end
        end
      end
    end
  end
end
