# Pivotal RubyMine Preferences #

Once upon a time, RubyMine shipped with keybindings that made no sense to anyone who had ever used a Mac. Hence, the Pivotal RubyMine preferences were born. It includes:

* Keymaps
* Ruby Code Styles
* Live Templates (ruby, jasmine)

Today, this project is both a repository of Pivotal's preferences for RubyMine - it's also a recommended workflow for tracking your team's customizations to RubyMine preferences. 

## Installation ##

First, *close RubyMine*. 

Then, run the following commands:

```sh
git clone http://github.com/pivotal/Pivotal-Preferences-RubyMine.git
cd Pivotal-Preferences-RubyMine
./mineprefs install
```

This will install the preferences into your *latest* version of RubyMine found in your ~/Library/Preferences folder. 
For example, if you have both RubyMine5 and RubyMine6 installed, it will only install the preferences into RubyMine6.

## Tracking changes ##

The installation process symlinks the pivotal preferences into your rubymine preferences folder. Thus, as you and 
your team change your preferences inside RubyMine, your clone of the preferences will note the changes, and you can
commit and push those changes to your own fork (or even submit pull requests back to the Pivotal repo for anything
you think is generally useful).

## Uninstall ##

If you'd like to uninstall the pivotal preferences and restore your original settings, first, *close RubyMine*. 
Then open a terminal and run the following commands:

```sh
cd /path/to/your/Pivotal-Preferences-RubyMine
./mineprefs uninstall
```
