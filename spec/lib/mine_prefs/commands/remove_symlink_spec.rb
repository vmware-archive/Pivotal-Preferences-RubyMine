require "mine_prefs/domain/commands/remove_symlink"
require "support/mocks/filesystem_spy"
require "support/mocks/preference_stub"

module MinePrefs::Domain::Commands
  describe RemoveSymlink do
    context "symlink for preference doesn't exist" do
      before { stub_symlink_existence location: preference_stub.target, exists: false }

      it "is invalid" do
        expect(command).to be_invalid
      end
    end

    context "symlink exists for preference" do
      before { stub_symlink_existence location: preference_stub.target, exists: true }

      it "is valid" do
        expect(command).to be_valid
      end

      it "removes the symlink" do
        command.execute

        expect(filesystem).to have_removed(preference_stub.target)
      end
    end

    def stub_symlink_existence(location: nil, exists: nil)
      filesystem.stub(:symlink?).with(location).and_return exists
    end

    let(:filesystem) { Spec::Support::Mocks::FilesystemSpy.new }
    let(:preference_stub) { Spec::Support::Mocks::PreferenceStub.new(target: "/some/target") }
    let(:command) { RemoveSymlink.new(filesystem: filesystem, preferences: [preference_stub]) }
  end
end
