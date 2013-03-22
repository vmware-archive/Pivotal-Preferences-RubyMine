#require 'pry'
DIRS = ['codestyles', 'colors', 'keymaps', 'templates']
FILES_IN_DIRS = ['options']
DEST = File.expand_path('~/Library/Preferences/RubyMine50')

desc "Symlinks dirs #{DIRS.join(",")} and all files in #{FILES_IN_DIRS.join(",")} into Rubymines preferences folder"
task :symlink do
  cwd = File.expand_path('.')
  DIRS.each do |dir|
    safe_symlink(File.join(cwd, dir), File.join(DEST, dir))
  end

  FILES_IN_DIRS.each do |dir|
    Dir.foreach(File.join(cwd, dir)) do |file|
      next if file == '.' or file == '..'
      safe_symlink(File.join(cwd, dir, file), File.join(DEST, dir, file))
    end
  end
end

desc "Resets dirs #{DIRS.join(",")} and all files in #{FILES_IN_DIRS.join(",")} into Rubymines preferences folder"
task :reset do
  cwd = File.expand_path('.')
  DIRS.each do |dir|
    reset_from_bak(File.join(DEST, dir))
  end

  FILES_IN_DIRS.each do |dir|
    Dir.foreach(File.join(cwd, dir)) do |file|
      next if file == '.' or file == '..'
      reset_from_bak(File.join(DEST, dir, file))
    end
  end
end

def safe_symlink(from, to)
  run("rm #{to}") if File.symlink?(to)
  run("mv #{to} #{to}.bak") if File.exist?(to)
  run("ln -s #{from} #{to}")
end

def reset_from_bak(file)
  run("rm #{file} && mv #{file}.bak #{file}") if(File.symlink?(file) && File.exist?("#{file}.bak"))
end

def run(cmd)
  puts "Running :#{cmd}\n\n"
  `#{cmd}`
end
