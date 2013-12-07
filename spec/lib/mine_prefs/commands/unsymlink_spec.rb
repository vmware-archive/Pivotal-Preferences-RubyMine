require "mine_prefs/commands/unsymlink"

module MinePrefs
  module Commands
    describe Unsymlink do
      describe "#execute" do
        it "removes the target files" do
          installation_bundle = [double(:file, target: "/target/file")]
          filesystem = double :filesystem

          filesystem.should_receive(:rm).with("/target/file")

          Unsymlink.new(filesystem: filesystem).execute(installation_bundle)
        end
      end
    end
  end
end
