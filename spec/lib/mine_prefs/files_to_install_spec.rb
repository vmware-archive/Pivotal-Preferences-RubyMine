require "mine_prefs/files_to_install"

module MinePrefs
  describe FilesToInstall do
    describe "#each" do
      it "returns the source and destination files for installation" do
        installation_pair = FilesToInstall.new(
          target_location: "/target",
          source_location: "/source",
          files_or_directories_to_install: ["/install_file"]
        ).first

        installation_pair.target.should == "/target/install_file"
        installation_pair.source.should == "/source/install_file"
      end
    end
  end
end
