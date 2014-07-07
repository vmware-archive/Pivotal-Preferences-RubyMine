require "mine_prefs/domain/execute"

module MinePrefs
  module Domain
    describe "Execute" do
      context "when the command has no failed validations" do
        before do
          command.stub(:failed_validations) do
            []
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

      context "when the command has failed validations" do
        before do
          command.stub(:failed_validations) do
            [failed_validation]
          end
        end

        it "notifies observers of failure" do
          execute

          expect(observer).to have_observed_failed_validations([failed_validation])
        end

        let(:failed_validation) { double :failed_validation }
      end

      let(:command) { CommandSpy.new }
      let(:observer) { ObserverSpy.new }

      class ObserverSpy
        def command_succeeded(*)
          @success = true
        end

        def validations_failed(failed_validations)
          @failed_validations = failed_validations
        end

        def has_observed_success?
          @success
        end

        def has_observed_failed_validations?(failed_validations)
          @failed_validations == failed_validations
        end
      end

      class CommandSpy
        def execute
          @executed = true
        end

        def has_executed?
          @executed
        end
      end

      def execute
        MinePrefs::Domain::Execute(command: command, observer: observer)
      end
    end
  end
end
