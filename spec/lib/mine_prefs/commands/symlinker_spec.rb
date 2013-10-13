require "mine_prefs/commands/symlinker"

module MinePrefs
  module Commands
    describe Symlinker do
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

          Symlinker.new(filesystem: filesystem).execute(installation)
        end
      end
    end
  end
end
