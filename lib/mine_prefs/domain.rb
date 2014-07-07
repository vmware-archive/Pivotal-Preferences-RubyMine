Dir[File.join(__dir__, "domain", "**", "*.rb")].each do |file|
  require file
end
