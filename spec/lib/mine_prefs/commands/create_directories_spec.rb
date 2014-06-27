require "mine_prefs/commands/create_directories"

module MinePrefs
  module Commands
    describe CreateDirectories do
      describe "#execute" do
        it "creates an options directory along with subsequent parent directories" do
          installation_bundle = double(:collection_of_files_to_install,
                                       target_location: "/baz/foo/bar")

          filesystem = double :filesystem

          filesystem.should_receive(:mkdir_p).with("/baz/foo/bar/options")

          CreateDirectories.new(filesystem: filesystem).execute(installation_bundle)
        end
      end

      describe "#undo" do
        it "does nothing" do
          CreateDirectories.new.undo
        end
      end
    end
  end
end
