module MinePrefs
  module Commands
    module Backups
      class BackupPathname
        def initialize(path)
          @path = path
        end

        def to_s
          "#{path}.bak"
        end

        def ==(string)
          to_s == string
        end

        private
        attr_reader :path
      end
    end
  end
end
