require "mine_prefs/method_hook"

module MinePrefs
  describe MethodHook do
    it "lets you run code before the method is called" do
      number_class = Class.new do
        def initialize(number: 0)
          @number = number
        end

        def add(another_number)
          @number += another_number
        end
      end

      message = ""

      MinePrefs::MethodHook.new(
        klass: number_class,
        method_name: :add,
        before: ->(another_number) do
          message = "called with #{another_number}"
        end
      )

      number_class.new.add(1)

      message.should == "called with 1"
    end

    it "lets you run code after the code is called" do
      number_class = Class.new do
        def initialize(number: 0)
          @number = number
        end

        def add(another_number)
          @number += another_number
        end
      end

      message = ""

      MinePrefs::MethodHook.new(
        klass: number_class,
        method_name: :add,
        after: ->(number_that_was_added, result) do
          message = "new number is #{result}"
        end
      )

      number_class.new(number: 1).add(1)

      message.should == "new number is 2"
    end
  end
end
