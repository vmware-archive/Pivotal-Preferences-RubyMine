#require 'pry'

desc "Symlinks colors keymap and templates into Rubymines preferences folder"
task :symlink do
  dest = File.expand_path('~/Library/Preferences/RubyMine50')
  dirs = ['colors', 'keymaps', 'templates']
  cwd = File.expand_path('.')
  dirs.each do |dir|
    file = File.join(dest, dir)
    run("rm #{file}") if File.symlink?(file)
    run("mv #{file} #{file}.bak") if File.exist?(file)
    run("ln -s #{File.join(cwd, dir)} #{file}")
  end
end

def run(cmd)
  puts "Running :#{cmd}\n\n"
  `#{cmd}`
end
