require "mine_prefs/method_hook"

MinePrefs::MethodHook.new(
  klass: MinePrefs::Commands::Symlink,
  method_name: :execute,
  before: ->(*args) do
    $logger.info "Symlinking Installation Files"
  end
)

MinePrefs::MethodHook.new(
  klass: MinePrefs::Commands::Symlink,
  method_name: :undo,
  before: ->(*args) do
    $logger.info "Removing symlinks to Pivotal RubyMine preferences"
  end
)
