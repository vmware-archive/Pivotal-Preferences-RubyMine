MinePrefs::MethodHook.new(
  klass: MinePrefs::Commands::CreateDirectories,
  method_name: :execute,
  before: ->(*args) do
    $logger.info "Creating RubyMine preference directories"
  end
)
