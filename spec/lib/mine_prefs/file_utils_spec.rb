require "mine_prefs/file_utils"

module MinePrefs
  describe FileUtils do
    describe "#mv" do
      let(:filesystem) { double :filesystem }

      context "source file exists" do
        it "should delegate to the filesystem" do
          filesystem.should_receive(:mv).with("source", "target", force: true)
          FileUtils.new(filesystem).mv("source", "target")
        end
      end

      context "source file does not exist" do
        before do
          filesystem.stub(:mv).and_raise FileUtils::SOURCE_FILE_NOT_FOUND
        end

        it "should not raise an exception" do
          expect {
            FileUtils.new(filesystem).mv("foo", "bar")
          }.not_to raise_exception
        end
      end
    end
  end
end
