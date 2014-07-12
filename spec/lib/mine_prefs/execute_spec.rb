require "mine_prefs/domain/execute"
require "support/mocks/command_spy"
require "support/mocks/command_stub"
require "support/mocks/observer_spy"

module MinePrefs
  module Domain
    describe "Execute" do
      context "when command is valid" do
        before do
          command.stub(:valid?) do
            true
          end
        end

        it "executes the command" do
          execute

          expect(command).to have_executed
        end

        it "notifies observers of success" do
          execute

          expect(observer).to have_observed_success
        end
      end

      context "when the command is invalid" do
        before do
          command.stub(:valid?) do
            false
          end
        end

        it "notifies observers of failure" do
          execute

          expect(observer).to have_observed_failed_validations(command.failed_validations)
        end

        let(:command) { Spec::Support::Mocks::CommandStub.new(failed_validations: "failed validations!") }
      end

      let(:command) { Spec::Support::Mocks::CommandSpy.new }
      let(:observer) { Spec::Support::Mocks::ObserverSpy.new }

      def execute
        MinePrefs::Domain::Execute(command: command, observer: observer)
      end
    end
  end
end
