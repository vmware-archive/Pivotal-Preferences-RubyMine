module MinePrefs
  class Installation
    attr_reader :install_commands, :files_to_install

    def initialize(install_commands: [], files_to_install: nil)
      @install_commands = install_commands
      @files_to_install = files_to_install
    end

    def install
      install_commands.each do |install_command|
        install_command.execute files_to_install
      end
    end

    def uninstall
      install_commands.reverse.each do |install_command|
        install_command.undo files_to_install
      end
    end
  end
end
