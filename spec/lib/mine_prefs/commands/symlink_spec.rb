require "mine_prefs/commands/symlink"
require "mine_prefs/commands/remove_symlink"

module MinePrefs
  module Commands
    describe "symlinking and unlinking preferences" do
      describe "symlinking" do
        it "symlinks all files to install into the target" do
          installation_bundle = [
            double(:installation_pair,
              source: "/source/foo/bar",
              target: "/baz/foo/bar"
            )
          ]

          filesystem = double :filesystem

          filesystem.should_receive(:symlink).with("/source/foo/bar", "/baz/foo/bar")

          Symlink.new(
            filesystem: filesystem,
            files_to_install: installation_bundle,
          ).execute
        end
      end

      describe "unlinking" do
        it "removes the symlinks" do
          installation_bundle = [
            double(:installation_pair,
              target: "/baz/foo/bar"
            )
          ]

          filesystem = double :filesystem

          filesystem.should_receive(:rm).with("/baz/foo/bar")

          RemoveSymlink.new(
            filesystem: filesystem,
            files_to_install: installation_bundle,
          ).execute
        end
      end
    end
  end
end
