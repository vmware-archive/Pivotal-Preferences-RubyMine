require "mine_prefs/method_hook"

MinePrefs::MethodHook.new(
  klass: MinePrefs::Commands::Symlink,
  method_name: :execute,
  before: ->(*) do
    $logger.info "Symlinking Installation Files"
  end
)

MinePrefs::MethodHook.new(
  klass: MinePrefs::Commands::RemoveSymlink,
  method_name: :execute,
  before: ->(*) do
    $logger.info "Removing symlinks to Pivotal RubyMine preferences"
  end
)
