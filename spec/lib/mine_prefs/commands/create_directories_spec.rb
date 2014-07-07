require "mine_prefs/domain/commands/create_directories"
require "mine_prefs/domain/commands/remove_empty_directories"

module MinePrefs
  module Domain
    module Commands
      describe "creating and removing directories" do
        context "the installation bundle assumes directories already exist in the target" do
          before do
            installation_bundle.stub(:directories_assumed_to_exist_in_target) do
              [assumed_dir]
            end
          end

          describe "#execute" do
            it "creates directories assumed to exist in the target" do
              command = CreateDirectories.new(filesystem: spy_filesystem, files_to_install: installation_bundle)

              command.execute

              expect(spy_filesystem).to have_created_directory(assumed_dir)
            end
          end

          describe "#undo" do
            it "removes empty directories that were assumed to exist in the target" do
              command = RemoveEmptyDirectories.new(filesystem: spy_filesystem, files_to_install: installation_bundle)

              command.execute

              expect(spy_filesystem).to have_removed_directory(assumed_dir)
            end
          end

          let(:spy_filesystem) { SpyFilesystem.new }
          let(:installation_bundle) { double(:installation_bundle) }
          let(:assumed_dir) { "/some/dir" }

          class SpyFilesystem
            def mkdir_p(dir)
              @made_directory = dir
            end

            def has_created_directory?(dir)
              @made_directory == dir
            end

            def rmdir(dir)
              @removed_dir = dir
            end

            def has_removed_directory?(dir)
              @removed_dir == dir
            end
          end
        end
      end
    end
  end
end
