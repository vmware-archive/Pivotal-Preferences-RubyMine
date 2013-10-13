module MinePrefs
  class InstallationPayload
    attr_reader :target, :source_location, :files_to_install

    def initialize(target: nil, source_location: nil, files_to_install: nil)
      @target = target
      @source_location = source_location
      @files_to_install = files_to_install
    end
  end
end
