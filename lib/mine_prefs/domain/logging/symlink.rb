require "mine_prefs/domain/method_hook"

MinePrefs::Domain::MethodHook.new(
  klass: MinePrefs::Domain::Commands::Symlink,
  method_name: :execute,
  before: ->(*) do
    $logger.info "Symlinking Installation Files"
  end
)

MinePrefs::Domain::MethodHook.new(
  klass: MinePrefs::Domain::Commands::RemoveSymlink,
  method_name: :execute,
  before: ->(*) do
    $logger.info "Removing symlinks to Pivotal RubyMine preferences"
  end
)
