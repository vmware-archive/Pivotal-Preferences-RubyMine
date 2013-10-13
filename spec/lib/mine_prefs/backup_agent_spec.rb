require "mine_prefs/backup_agent"

module MinePrefs
  describe BackupAgent do
    describe "#prepare_installation" do
      it "backs up all files that will be replaced by the installation" do
        installation = double :installation, files_to_install: ["foo"], target: "/bar"
        filesystem = double :filesystem

        filesystem.should_receive(:mv).with("/bar/foo", "/bar/foo.bak")

        BackupAgent.new(filesystem: filesystem).prepare_installation(installation)
      end
    end
  end
end
