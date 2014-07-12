require "mine_prefs/domain/commands/symlink"
require "mine_prefs/domain/commands/remove_symlink"
require "support/mocks/filesystem_spy"

module MinePrefs
  module Domain
    module Commands
      describe "symlinking and unlinking preferences" do
        describe "symlinking" do
          let(:command) do
            Symlink.new(
              filesystem: filesystem_spy,
              preferences: preferences,
            )
          end

          context "when the target does not already contain symlinks" do
            before do
              def filesystem_spy.symlink?(*)
                false
              end
            end

            it "symlinks all files to install into the target" do
              execute_command

              expect(filesystem_spy).to have_symlinked(source, target)
            end
          end

          context "when the target already contains symlinks" do
            before do
              def filesystem_spy.symlink?(*)
                true
              end
            end

            it "is invalid" do
              expect(command).not_to be_valid
            end
          end
        end

        describe "unlinking" do
          let(:command) do
            RemoveSymlink.new(
              filesystem: filesystem_spy,
              preferences: preferences,
            )
          end

          it "removes the symlinks" do
            execute_command
            expect(filesystem_spy).to have_removed(target)
          end
        end

        def execute_command
          command.execute
        end

        let(:preferences) { [double(:preference, target: target, source: source)] }
        let(:target) { "/some/target" }
        let(:source) { "/some/source" }
        let(:filesystem_spy) { Spec::Support::Mocks::FilesystemSpy.new }
      end
    end
  end
end
