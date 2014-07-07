module MinePrefs
  module Domain
    class FilesToInstall
      include Enumerable

      attr_reader :target_location, :source_location, :files_or_directories_to_install

      def initialize(target_location: nil, source_location: nil, files_or_directories_to_install: nil)
        @target_location = target_location
        @source_location = source_location
        @files_or_directories_to_install = files_or_directories_to_install
      end

      def each(&block)
        installable_files.each &block
      end

      def directories_assumed_to_exist_in_target
        map(&:directories_assumed_to_exist_in_target).flatten.compact
      end

      private
      def installable_files
        files_or_directories_to_install.map do |file_to_install|
          file_to_install_relative_path_to_source = file_to_install.gsub(source_location, '')

          InstallableFile.new(
            source_location: source_location,
            target_location: target_location,
            file_path: file_to_install_relative_path_to_source,
          )
        end
      end

      def source_location
        File.join(@source_location, "/")
      end

      class InstallableFile
        def initialize(
          source_location: nil,
            target_location: nil,
            file_path: nil
        )
          @source_location = source_location
          @target_location = target_location
          @file_path = file_path
        end

        def source
          File.join(source_location, file_path)
        end

        def target
          File.join(target_location, file_path)
        end

        def directories_assumed_to_exist_in_target
          exploded_directory_path = file_path.split("/")
          exploded_directory_path.pop

          assumed_dirs = [target_location]

          exploded_directory_path.each do |path_segment|
            assumed_dirs << File.join(assumed_dirs.last.to_s, path_segment)
          end

          assumed_dirs
        end

        private
        attr_reader(
          :target_location,
          :source_location,
          :file_path,
        )
      end
    end
  end
end
