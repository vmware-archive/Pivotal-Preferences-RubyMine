module MinePrefs
  class Installation
    attr_reader :preparers, :installers, :installation_payload

    def initialize(preparers: [], installers: [], installation_payload: nil)
      @preparers = preparers
      @installers = installers
      @installation_payload = installation_payload
    end

    def install
      run_preparers
      run_installers
    end


    private

    def run_installers
      installers.each do |installer|
        installer.install installation_payload
      end
    end

    def run_preparers
      preparers.each do |preparer|
        preparer.prepare_installation installation_payload
      end
    end
  end
end
