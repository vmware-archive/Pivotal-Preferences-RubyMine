require "mine_prefs/method_hook"

MinePrefs::MethodHook.new(
  klass: MinePrefs::Commands::Backups::Backup,
  method_name: :execute,
  before: ->(*args) do
    $logger.info "Backing up existing RubyMine preference files"
  end
)

MinePrefs::MethodHook.new(
  klass: MinePrefs::Commands::Backups::Backup,
  method_name: :undo,
  before: ->(*args) do
    $logger.info "Restoring RubyMine preference files from backup"
  end
)
