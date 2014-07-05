MinePrefs::MethodHook.new(
  klass: MinePrefs::FileUtils,
  method_name: :symlink,
  before: ->(source, target) do
    $logger.debug "Symlinking: "
    $logger.debug "\t#{source}"
    $logger.debug "\tto"
    $logger.debug "\t#{target}"
  end
)

MinePrefs::MethodHook.new(
  klass: MinePrefs::FileUtils,
  method_name: :mv,
  before: ->(source, target) do
    $logger.debug "Moving: "
    $logger.debug "\t#{source}"
    $logger.debug "\tto"
    $logger.debug "\t#{target}"
  end
)

MinePrefs::MethodHook.new(
  klass: MinePrefs::FileUtils,
  method_name: :rmdir,
  before: ->(path) do
    $logger.debug "Removing dir if empty: #{path}"
  end
)

MinePrefs::MethodHook.new(
  klass: MinePrefs::FileUtils,
  method_name: :rm,
  before: ->(path) do
    $logger.debug "Removing #{path}"
  end
)
