Feature: Uninstall Preferences

  Scenario: Prefs already installed
    Given RubyMine is installed
    And the Pivotal Preferences are already installed
    When I run:
      """
        ruby mineprefs uninstall
      """
    Then the Pivotal Preferences should be uninstalled
