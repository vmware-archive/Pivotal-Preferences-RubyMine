module MinePrefs
  class Installation
    attr_reader :install_commands, :uninstall_commands, :installation_payload

    def initialize(install_commands: [], uninstall_commands: [], installation_payload: nil)
      @install_commands = install_commands
      @uninstall_commands = uninstall_commands
      @installation_payload = installation_payload
    end

    def install
      install_commands.each do |install_command|
        install_command.execute installation_payload
      end
    end

    def uninstall
      uninstall_commands.each do |uninstall_command|
        uninstall_command.execute installation_payload
      end
    end
  end
end
