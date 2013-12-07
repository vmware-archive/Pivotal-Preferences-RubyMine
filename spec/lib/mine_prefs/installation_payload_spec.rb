require "mine_prefs/installation_payload"

module MinePrefs
  describe InstallationPayload do
    describe "#each" do
      it "returns the source and destination files for installation" do
        installation_pair = InstallationPayload.new(
          target_location: "/target",
          source_location: "/source",
          files_to_install: ["/install_file"]
        ).first

        installation_pair.target.should == "/target/install_file"
        installation_pair.source.should == "/source/install_file"
      end
    end
  end
end
