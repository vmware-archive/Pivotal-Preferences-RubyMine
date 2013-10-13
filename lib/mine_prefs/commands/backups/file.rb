module MinePrefs
  module Commands
    module Backups
      class File
        def initialize(path)
          @path = path
        end

        def to_s
          "#{path}.bak"
        end

        private
        attr_reader :path
      end
    end
  end
end
