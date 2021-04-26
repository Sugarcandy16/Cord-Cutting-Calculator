Feature: User
  
  As a channel watcher
  So that I don’t need to click selected channels again to remove them from my list
  I want to add a button to the “Select the Channels” dropdown

 Scenario: Pressed Channels Reset Button 
     Given I am on the calculator
     Then I check "CNN" in "Must have channels"
     And I reset "Must have channels"
     Then I should see all "Must have channels" unchecked
     Then I check "ABC" in "Would like to have channels"
     And I reset "Would like to have channels"
     Then I should see all "Would like to have channels" unchecked
     Then I check "BBC" in "OK to have channels"
     And I reset "OK to have channels"
     Then I should see all "OK to have channels" unchecked
     
  # Scenario: Pressed Channels Reset Button 
  #   Given I am on the packages page
  #   When I follow "New Package"
  #   Then I should be on the new package page
  #   And I fill in "Name" with "ABC"
  #   And I fill in "Cost" with "10"
  #   And I fill in "Link" with "https://www.Youtube.com"
  #   Then I check "DVR"
  #   Then I check "KTV"
  #   Then I check "Mobile"
  #   And I press "Reset Channels"
  #   Then I should see all channels unchecked
  #   Then I check "CNN"
  #   Then I check "Apple"
  #   And I press "Reset Devices"
  #   Then I should see all devices unchecked
  #   Then I check "Roku"
  #   Then I check "SuddenLink"
  #   And I press "Reset Top Boxes"
  #   Then I should see all top boxes unchecked
  #   Then I check "TWC"
  #   And I press "Submit"
  #   Then I should see "Create success!"