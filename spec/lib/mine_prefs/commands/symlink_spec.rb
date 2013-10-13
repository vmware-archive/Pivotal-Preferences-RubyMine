require "mine_prefs/commands/symlink"

module MinePrefs
  module Commands
    describe Symlink do
      describe "#execute" do
        it "symlinks all files to install into the target" do
          installation = double :installation, installation_pairs: [
            double(:installation_pair,
              source: "/source/foo/bar",
              target: "/baz/foo/bar"
            )
          ]

          filesystem = double :filesystem

          filesystem.should_receive(:symlink).with("/source/foo/bar", "/baz/foo/bar")

          Symlink.new(filesystem: filesystem).execute(installation)
        end
      end
    end
  end
end
