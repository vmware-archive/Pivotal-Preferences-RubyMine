require "fileutils"
require "logger"
require "mine_prefs/installation"
require "mine_prefs/files_to_install"
require "mine_prefs/file_utils"
require "mine_prefs/commands/create_directories"
require "mine_prefs/commands/symlink"
require "mine_prefs/commands/backups/backup"
require "mine_prefs/commands/backups/backup_pathname"
require "mine_prefs/method_hook"
require "mine_prefs/logging/symlink"
require "mine_prefs/logging/backup"
require "mine_prefs/logging/create_directories"
require "mine_prefs/logging/file_utils"
require "mine_prefs/logging/installation"
require "optparse"

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

feature = ARGV.first || 'install'

MinePrefs::Installation.new(
  files_to_install: files_to_install,
  install_commands: [
    MinePrefs::Commands::CreateDirectories.new,
    MinePrefs::Commands::Backups::Backup.new,
    MinePrefs::Commands::Symlink.new
  ]
).send(feature)
