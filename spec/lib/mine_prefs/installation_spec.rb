require "mine_prefs/installation"

module MinePrefs
  describe Installation do
    it "installs preferences by executing all of the commands in order" do
      install_command = double(:install_command)

      installation_payload = double(:installation_payload)

      installation = Installation.new(
        install_commands: [install_command],
        installation_payload: installation_payload
      )

      install_command.should_receive(:execute).with(installation_payload)

      installation.install
    end

    it "uninstalls by undoing all of the install commands in reverse order" do
      install_command = double(:install_command)

      installation_payload = double(:installation_payload)

      installation = Installation.new(
        install_commands: [install_command],
        installation_payload: installation_payload
      )

      install_command.should_receive(:undo).with(installation_payload)

      installation.uninstall
    end
  end
end
