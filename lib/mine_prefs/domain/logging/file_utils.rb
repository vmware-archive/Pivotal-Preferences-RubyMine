require "mine_prefs/domain/method_hook"

MinePrefs::Domain::MethodHook.new(
  klass: MinePrefs::Domain::FileUtils,
  method_name: :symlink,
  before: ->(source, target) do
    $logger.debug "Symlinking: "
    $logger.debug "\t#{source}"
    $logger.debug "\tto"
    $logger.debug "\t#{target}"
  end
)

MinePrefs::Domain::MethodHook.new(
  klass: MinePrefs::Domain::FileUtils,
  method_name: :mv,
  before: ->(source, target) do
    $logger.debug "Moving: "
    $logger.debug "\t#{source}"
    $logger.debug "\tto"
    $logger.debug "\t#{target}"
  end
)

MinePrefs::Domain::MethodHook.new(
  klass: MinePrefs::Domain::FileUtils,
  method_name: :rmdir,
  before: ->(path) do
    $logger.debug "Removing dir if empty: #{path}"
  end
)

MinePrefs::Domain::MethodHook.new(
  klass: MinePrefs::Domain::FileUtils,
  method_name: :rm,
  before: ->(path) do
    $logger.debug "Removing #{path}"
  end
)
