require "mine_prefs/symlinker"

module MinePrefs
  module Commands
    describe Symlinker do
      describe "#execute" do
        it "symlinks all files to install into the target" do
          installation = double :installation, source_location: "/source", files_to_install: ["foo/bar"], target: "/baz"

          filesystem = double :filesystem

          filesystem.should_receive(:symlink).with("/source/foo/bar", "/baz/foo/bar")

          Symlinker.new(filesystem: filesystem).execute(installation)
        end
      end
    end
  end
end
