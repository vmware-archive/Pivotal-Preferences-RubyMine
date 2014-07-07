require "fileutils"
require "logger"
require "optparse"

module MinePrefs
end

Dir[File.join(__dir__, "mine_prefs", "**", "*.rb")].each do |file|
  require file
end

require "mine_prefs/cli"

MinePrefs::Cli::App.run


