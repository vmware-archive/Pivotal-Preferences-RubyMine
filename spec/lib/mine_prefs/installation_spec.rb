require "mine_prefs/installation"

module MinePrefs
  describe Installation do
    describe "#execute" do
      it "tells all of the install commands to execute" do
        install_command = double(:install_command)

        installation_payload = double(:installation_payload)

        installation = Installation.new(
          install_commands: [install_command],
          installation_payload: installation_payload
        )

        install_command.should_receive(:execute).with(installation_payload)

        installation.install
      end
      
      it "tells all of the installers to install the installation" do
        installer = double(:installer)

        installation_payload = double(:installation_payload)

        installation = Installation.new(
          installers: [installer],
          installation_payload: installation_payload
        )

        installer.should_receive(:execute).with(installation_payload)

        installation.install
      end
    end
  end
end
