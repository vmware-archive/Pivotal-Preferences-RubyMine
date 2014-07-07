Dir[File.join(__dir__, "cli", "**", "*.rb")].each do |file|
  require file
end
