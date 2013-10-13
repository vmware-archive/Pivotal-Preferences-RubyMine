require "mine_prefs/installation"

module MinePrefs
  describe Installation do
    describe "#install" do
      it "tells all of the installation preparers to prepare the installation" do
        preparer = double(:preparer)

        installation_payload = double(:installation_payload)

        installation = Installation.new(
          preparers: [preparer],
          installation_payload: installation_payload
        )

        preparer.should_receive(:prepare_installation).with(installation_payload)

        installation.install
      end
      
      it "tells all of the installers to install the installation" do
        installer = double(:installer)

        installation_payload = double(:installation_payload)

        installation = Installation.new(
          installers: [installer],
          installation_payload: installation_payload
        )

        installer.should_receive(:install).with(installation_payload)

        installation.install
      end
    end
  end
end
