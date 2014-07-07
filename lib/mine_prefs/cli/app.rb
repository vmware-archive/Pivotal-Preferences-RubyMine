require "logger"
require "optparse"

module MinePrefs
  module Cli
    class App
      def self.run
        new.run
      end

      def run
        parse_options
        setup_logging
        execute_action
      end

      private
      def parse_options
        OptionParser.new do |opts|
          opts.banner = "Usage: mineprefs [options] (install|uninstall)"

          opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
            if v
              @log_level = Logger::DEBUG
            else
              @log_level = Logger::INFO
            end
          end

          opts.on("-s", "--silent", "Output nothing") do |s|
            @log_level = Logger::UNKNOWN
          end
        end.parse!
      end

      def log_level
        @log_level ||= Logger::INFO
      end

      def setup_logging
        $logger = Logger.new(STDOUT)
        $logger.progname = "mineprefs"
        $logger.level = log_level
        $logger.formatter = proc do |severity, datetime, progname, msg|
          "#{datetime}: #{severity} - #{msg}\n"
        end
      end

      def execute_action
        action = Module.const_get("MinePrefs::Cli::Actions::#{ARGV.first.capitalize}Action")
        action.new(preferences: preferences).execute
      end

      def preferences
        @preferences ||= begin
          existing_target_directory = Dir[File.expand_path(File.join("~", "Library", "Preferences", "RubyMine*"))].last

          fallback_target_directory = File.expand_path(File.join("~", "Library", "Preferences", "RubyMine60"))

          pivotal_rubymine_preferences_directory = File.join(__dir__, "..", "..", "..", "RubyMineXX")

          MinePrefs::Domain::Preferences.new(
            target_location: ENV['TARGET_DIR'] || existing_target_directory || fallback_target_directory,
            source_location: pivotal_rubymine_preferences_directory,
            files_or_directories_to_install:
              ["keymaps", "codestyles", "templates"] +
                Dir[File.join(pivotal_rubymine_preferences_directory, "options", "**", "*")],
          )
        end
      end
    end
  end
end
