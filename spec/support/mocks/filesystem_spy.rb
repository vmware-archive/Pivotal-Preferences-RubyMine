module Spec
  module Support
    module Mocks
      class FilesystemSpy
        def symlink(source, target)
          @symlinked = [source, target]
        end

        def rm(file)
          @removed = file
        end

        def has_symlinked?(source, target)
          @symlinked == [source, target]
        end

        def has_removed?(file)
          @removed == file
        end
      end
    end
  end
end
