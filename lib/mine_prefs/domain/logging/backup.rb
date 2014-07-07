require "mine_prefs/domain/method_hook"

MinePrefs::Domain::MethodHook.new(
  klass: MinePrefs::Domain::Commands::Backup,
  method_name: :execute,
  before: ->(*args) do
    $logger.info "Backing up existing RubyMine preference files"
  end
)

MinePrefs::Domain::MethodHook.new(
  klass: MinePrefs::Domain::Commands::Restore,
  method_name: :execute,
  before: ->(*args) do
    $logger.info "Restoring RubyMine preference files from backup"
  end
)
