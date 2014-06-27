require "pathname"

module Helpers
  def installed_path_to(file_or_dir)
    File.expand_path(File.join(File.dirname(File.expand_path(__FILE__)), "..", "..", "tmp", "RubyMine60", file_or_dir))
  end

  def repo_path_to(file_or_dir)
    File.expand_path(File.join(File.dirname(File.expand_path(__FILE__)), "..", "..", "RubyMineXX", file_or_dir))
  end
end

World Helpers

Given(/^RubyMine is installed$/) do
  system "rm -rf tmp/RubyMine60"
end

When(/^the Pivotal Preferences are not already installed$/) do
end

When(/^I run:$/) do |command|
  system("TARGET_DIR=tmp/RubyMine60 #{command}")
end

Then(/^the Pivotal Preferences should be installed and take effect when I start RubyMine$/) do
  Pathname.new(installed_path_to("codestyles")).realpath.should ==
    Pathname.new(repo_path_to("codestyles"))
end

When(/^the Pivotal Preferences are already installed$/) do
  system "mkdir tmp/RubyMine60"
  system "cp -r features/fixtures/PrefsTemplate/* tmp/RubyMine60"
  system("TARGET_DIR=tmp/RubyMine60 ruby mineprefs install")
end

Then(/^the Pivotal Preferences should be uninstalled$/) do
  Pathname.new(installed_path_to("codestyles")).realpath.should ==
    Pathname.new(installed_path_to("codestyles"))
end
