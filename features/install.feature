Feature: Install Preferences

  Scenario: RubyMine installed but Preferences not previously installed
    Given RubyMine is installed
    And the Pivotal Preferences are not already installed
    When I run:
      """
        ruby mineprefs install
      """
    Then the Pivotal Preferences should be installed and take effect when I start RubyMine
