module MinePrefs
  class Installation
    attr_reader :install_commands, :installation_payload

    def initialize(install_commands: [], installation_payload: nil)
      @install_commands = install_commands
      @installation_payload = installation_payload
    end

    def install
      install_commands.each do |install_command|
        install_command.execute installation_payload
      end
    end

    def uninstall
      install_commands.reverse.each do |install_command|
        install_command.undo installation_payload
      end
    end
  end
end
