# Pivotal RubyMine Preferences #

## Installation ##
**Note:** _It is recommended to not be running RubyMine when you set these symlinks as RM sometimes keeps changes in memory and writes them when you exit which could cause it to overwrite some of these settings.  If RubyMine is running you will need to restart before the keybindings will be available._
### To install ###
    git clone http://github.com/pivotal/Pivotal-Preferences-RubyMine.git
    cd Pivotal-Preferences-RubyMine
    rake symlink:all

### To uninstall ###
    rake reset:all

### To install individual components ###
	rake symlink:codestyles  # Symlinks codestyles into /Users/jbarnes/Library/Preferences/RubyMineXX
	rake symlink:colors      # Symlinks colors into /Users/jbarnes/Library/Preferences/RubyMineXX
	rake symlink:keymaps     # Symlinks keymaps into /Users/jbarnes/Library/Preferences/RubyMineXX
	rake symlink:options     # Symlinks all files in options into /Users/jbarnes/Library/Preferences/RubyMineXX/options
	rake symlink:templates   # Symlinks templates into /Users/jbarnes/Library/Preferences/RubyMineXX
	rake reset:codestyles    # Resets symlinked dir /Users/jbarnes/Library/Preferences/RubyMineXX/codestyles
	rake reset:colors        # Resets symlinked dir /Users/jbarnes/Library/Preferences/RubyMineXX/colors
	rake reset:keymaps       # Resets symlinked dir /Users/jbarnes/Library/Preferences/RubyMineXX/keymaps
	rake reset:options       # Resets all symlinked files in /Users/jbarnes/Library/Preferences/RubyMineXX/options
	rake reset:templates     # Resets symlinked dir /Users/jbarnes/Library/Preferences/RubyMineXX/templates


## These preferences include customizations for: ##
* **Pivotal Standard RubyMine Keymap**
* **Pivotal Standard RubyMine JVM Options** _These are the JVM options that we find to work well for the kinds of projects we develop on modern iMacs._
* **RubyMine Live Templates for working with Ruby** _A few handy shortcuts in addition to those shipping with RubyMine._
    * **Jasmine**
        * the various Jasmine blocks (describe(), it(), runs(), etc.)
