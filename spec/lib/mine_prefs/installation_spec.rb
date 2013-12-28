require "mine_prefs/installation"

module MinePrefs
  describe Installation do
    it "installs preferences by executing all of the commands in order" do
      install_command = double(:install_command)

      files_to_install = double(:files_to_install)

      installation = Installation.new(
        install_commands: [install_command],
        files_to_install: files_to_install
      )

      install_command.should_receive(:execute).with(files_to_install)

      installation.install
    end

    it "uninstalls by undoing all of the install commands in reverse order" do
      install_command = double(:install_command)

      files_to_install = double(:files_to_install)

      installation = Installation.new(
        install_commands: [install_command],
        files_to_install: files_to_install
      )

      install_command.should_receive(:undo).with(files_to_install)

      installation.uninstall
    end
  end
end
