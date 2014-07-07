require "mine_prefs/domain/preferences"

module MinePrefs
  module Domain
    describe Preferences do
      context "given an un-nested, relative file path" do
        let(:file) { "install_file" }

        it "calculates the target location of a file by combining the target path with the relative file path" do
          file_to_install.target.should == "/target/install_file"
        end

        it "calculates the source location by combining the source path with the relative file path" do
          file_to_install.source.should == "/source/install_file"
        end

        it "lists the target directory as the only directory assumed to exist" do
          expect(preferences.directories_assumed_to_exist_in_target).to eq(["/target"])
        end
      end

      context "given an un-nested file absolute path under source" do
        let(:file) { "/source/install_file" }

        it "calculates the target location of a file by combining the target path with the file path relative to the source" do
          file_to_install.target.should == "/target/install_file"
        end

        it "uses the file path provided as the source path" do
          file_to_install.source.should == file
        end

        it "lists the target directory as the only directory assumed to exist" do
          expect(preferences.directories_assumed_to_exist_in_target).to eq(["/target"])
        end
      end

      context "given a nested file path, relative to the source" do
        let(:file) { "some_dir/some_other_dir/some_file" }

        it "returns the nested directories in the order they should be created" do
          expect(preferences.directories_assumed_to_exist_in_target).to eq(
            [
              "/target",
              "/target/some_dir",
              "/target/some_dir/some_other_dir"
            ]
          )
        end
      end

      context "given a nested absolute file path to install" do
        let(:file) { "/source/some_dir/some_other_dir/some_file" }

        it "returns the nested directories in the order they should be created" do
          expect(preferences.directories_assumed_to_exist_in_target).to eq(
            [
              "/target",
              "/target/some_dir",
              "/target/some_dir/some_other_dir"
            ]
          )
        end
      end

      let(:preferences) do
        Preferences.new(
          target_location: "/target",
          source_location: "/source",
          files_or_directories_to_install: [file]
        )
      end

      let(:file_to_install) { preferences.first }
    end
  end
end
