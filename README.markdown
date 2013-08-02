Pivotal RubyMine Preferences
============================

**IMPORTANT NOTE:  In all of the following paths/commands, replace "XX" with your proper RubyMine version**

Pivotal Standard RubyMine Keymap
--------------------------------

To install these keybindings into RubyMine copy the pivotal.xml file to this path:

~~~
~/Library/Preferences/RubyMineXX/keymaps/
~~~

and then copy the options/macros.xml file to this path:

~~~
~/Library/Preferences/RubyMineXX/options/
~~~

...or you can just run the following command (warning: copying the macros down will simply replace your existing macros file. Merge by hand if that's a problem.):

~~~
wget --no-check-certificate -O ~/Library/Preferences/RubyMineXX/keymaps/pivotal.xml http://github.com/pivotal/Pivotal-Preferences-RubyMine/raw/master/keymaps/Pivotal.xml
wget --no-check-certificate -O ~/Library/Preferences/RubyMineXX/options/macros.xml http://github.com/pivotal/Pivotal-Preferences-RubyMine/raw/master/options/macros.xml
~~~

If RubyMine is running you will need to restart before the keybindings will be available.


RubyMine Live Templates for working with Ruby
---------------------------------------------

A few handy shortcuts in addition to those shipping with RubyMine.

**To Install:**

Clone & then copy Ruby.xml into this path:

~~~
~/Library/Preferences/RubyMineXX/templates/
~~~

...or you can just run the following command:

~~~
wget --no-check-certificate -O ~/Library/Preferences/RubyMineXX/templates/Ruby.xml http://github.com/pivotal/Pivotal-Preferences-RubyMine/raw/master/templates/Ruby.xml
~~~

If RubyMine is running you will need to restart before the templates will be available.


RubyMine Live Templates for writing Palm(R) webOS(tm)
-----------------------------------------------------

Included are templates for (among other things):

  * the various Jasmine blocks (describe(), it(), runs(), etc.)
  * blocking out the main entry points for a webOS Scene Assistant
  * making a new protoype property on a JavaScript class

These should be useful for any JavaScript/Jasmine project

**To Install:**

Clone & then copy jasmine.xml and webOS.xml into this path:

~~~
~/Library/Preferences/RubyMineXX/templates/
~~~

...or you can just run the following commands:

~~~
wget --no-check-certificate -O ~/Library/Preferences/RubyMineXX/templates/jasmine.xml http://github.com/pivotal/Pivotal-Preferences-RubyMine/raw/master/templates/jasmine.xml
~~~

~~~
wget --no-check-certificate -O ~/Library/Preferences/RubyMineXX/templates/webOS.xml http://github.com/pivotal/Pivotal-Preferences-RubyMine/raw/master/templates/webOS.xml
~~~

If RubyMine is running you will need to restart before the templates will be available.
