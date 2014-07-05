require "mine_prefs/method_hook"

MinePrefs::MethodHook.new(
  klass: MinePrefs::Installation,
  method_name: :install,
  after: ->(*) do
    $logger.info "Pivotal RubyMine Preferences install complete!"
  end
)

MinePrefs::MethodHook.new(
  klass: MinePrefs::Installation,
  method_name: :uninstall,
  after: ->(*) do
    $logger.info "Pivotal RubyMine Preferences uninstall complete!"
  end
)
