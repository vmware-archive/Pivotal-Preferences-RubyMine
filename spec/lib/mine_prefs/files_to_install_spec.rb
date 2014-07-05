require "mine_prefs/files_to_install"

module MinePrefs
  describe FilesToInstall do
    context "files or directories to install are relative to source" do
      let(:file) { "install_file" }

      it "calculates the target location of a file by combining the target path with the relative file path" do
        file_to_install.target.should == "/target/install_file"
      end

      it "calculates the source location by combining the source path with the relative file path" do
        file_to_install.source.should == "/source/install_file"
      end
    end

    context "files or directories to install are absolute paths" do
      let(:file) { "/source/install_file" }

      it "calculates the target location of a file by combining the target path with the file path relative to the source" do
        file_to_install.target.should == "/target/install_file"
      end

      it "calculates the source location by combining the source path with the file path relative to the source" do
        file_to_install.source.should == "/source/install_file"
      end
    end

    context "given a file to install deep within the target" do
      let(:file) { "some_dir/some_other_dir/some_file" }

      it "returns directories in the order they should be created" do
        expect(files_to_install.directories_assumed_to_exist_in_target).to eq(
          ["/target", "/target/some_dir", "/target/some_dir/some_other_dir"]
        )
      end
    end

    let(:files_to_install) do
      FilesToInstall.new(
        target_location: "/target",
        source_location: "/source",
        files_or_directories_to_install: [file]
      )
    end

    let(:file_to_install) { files_to_install.first }
  end
end
