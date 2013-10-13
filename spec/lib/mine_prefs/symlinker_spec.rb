require "mine_prefs/symlinker"

module MinePrefs
  describe Symlinker do
    describe "#install" do
      it "symlinks all files to install into the target" do
        installation = double :installation, source_location: "/source", files_to_install: ["foo/bar"], target: "/baz"

        filesystem = double :filesystem

        filesystem.should_receive(:symlink).with("/source/foo/bar", "/baz/foo/bar")

        Symlinker.new(filesystem: filesystem).install(installation)
      end
    end
  end
end
