require "mine_prefs/domain/method_hook"

MinePrefs::Domain::MethodHook.new(
  klass: MinePrefs::Domain::Commands::CreateDirectories,
  method_name: :execute,
  before: ->(*args) do
    $logger.info "Creating RubyMine preference directories"
  end
)

MinePrefs::Domain::MethodHook.new(
  klass: MinePrefs::Domain::Commands::RemoveEmptyDirectories,
  method_name: :execute,
  before: ->(*args) do
    $logger.info "Removing Empty Directories"
  end
)
