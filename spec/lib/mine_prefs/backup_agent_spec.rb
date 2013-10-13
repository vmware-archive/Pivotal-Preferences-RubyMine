require "mine_prefs/backup_agent"

module MinePrefs
  describe BackupAgent do
    describe "#prepare_installation" do
      context "file to be replaced by installation does not already exist in target" do
        it "should silently ignore it" do
          installation = double :installation, files_to_install: ["foo"], target: "/bar"
          filesystem = double :filesystem

          filesystem.stub(:mv).with("/bar/foo", "/bar/foo.bak", force: true).and_raise Errno::ENOENT

          BackupAgent.new(filesystem: filesystem).prepare_installation(installation)
        end
      end

      context "target file exists" do
        it "backs up all files that will be replaced by the installation" do
          installation = double :installation, files_to_install: ["foo"], target: "/bar"
          filesystem = double :filesystem

          filesystem.should_receive(:mv).with("/bar/foo", "/bar/foo.bak", force: true)

          BackupAgent.new(filesystem: filesystem).prepare_installation(installation)
        end
      end

      context "backup file already exists" do
        it "backs up the target file anyways, overwriting the original backup file" do
          installation = double :installation, files_to_install: ["foo"], target: "/bar"
          filesystem = double :filesystem

          filesystem.should_receive(:mv).with("/bar/foo", "/bar/foo.bak", force: true)

          BackupAgent.new(filesystem: filesystem).prepare_installation(installation)
        end
      end
    end
  end
end
