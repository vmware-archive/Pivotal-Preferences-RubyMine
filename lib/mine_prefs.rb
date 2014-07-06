require "fileutils"
require "logger"
require "optparse"

module MinePrefs
end

Dir[File.join(__dir__, "mine_prefs", "**", "*.rb")].each do |file|
  require file
end

options = {log_level: Logger::INFO}

OptionParser.new do |opts|
  opts.banner = "Usage: mineprefs [options] (install|uninstall)"

  opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
    if v
      options[:log_level] = Logger::DEBUG
    else
      options[:log_level] = Logger::INFO
    end
  end

  opts.on("-s", "--silent", "Output nothing") do |s|
    options[:log_level] = Logger::UNKNOWN
  end
end.parse!

$logger = Logger.new(STDOUT)
$logger.progname = "mineprefs"
$logger.level = options[:log_level]
$logger.formatter = proc do |severity, datetime, progname, msg|
  "#{datetime}: #{severity} - #{msg}\n"
end

existing_target_directory = Dir[File.expand_path(File.join("~", "Library", "Preferences", "RubyMine*"))].last

fallback_target_directory = File.expand_path(File.join("~", "Library", "Preferences", "RubyMine60"))

files_to_install = MinePrefs::FilesToInstall.new(
  target_location: ENV['TARGET_DIR'] || existing_target_directory || fallback_target_directory,
  source_location: File.join(File.dirname(File.expand_path(__FILE__)), "..", "RubyMineXX"),
  files_or_directories_to_install:
    ["keymaps", "codestyles", "templates"] +
    Dir[File.join(File.join(File.dirname(File.expand_path(__FILE__)), "..", "RubyMineXX"), "options", "**", "*")],
)

case ARGV.first
  when "install"
    command = MinePrefs::Commands::Install(preferences: files_to_install)
  when "uninstall"
    command = MinePrefs::Commands::Uninstall(preferences: files_to_install)
  else
    raise "Unknown Command"
end

MinePrefs::Execute(
  command: command,
  observer: self,
)
