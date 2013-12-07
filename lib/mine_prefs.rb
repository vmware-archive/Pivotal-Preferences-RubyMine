require "fileutils"
require "mine_prefs/installation"
require "mine_prefs/installation_payload"
require "mine_prefs/commands/symlink"
require "mine_prefs/commands/unsymlink"
require "mine_prefs/commands/backups/backup"
require "mine_prefs/commands/backups/file"

source_location   = File.join(File.dirname(File.expand_path(__FILE__)), "..", "RubyMineXX")
options           = Dir[File.join(source_location, "options", "**", "*")].map { |file| file.gsub %r{.*/(options.*)}, '\1' }
target_location   = ENV['TARGET_DIR'] || Dir[File.expand_path(File.join("~", "Library", "Preferences", "RubyMine*"))].last

installation_payload = MinePrefs::InstallationPayload.new(
  target_location: target_location,
  source_location: source_location,
  files_to_install: [
    "keymaps",
    "codestyles",
    "templates",
  ] + options,
)

MinePrefs::Installation.new(
  installation_payload: installation_payload,
  install_commands: [
    MinePrefs::Commands::Backups::Backup.new,
    MinePrefs::Commands::Symlink.new
  ]
).send(ARGV.first)
