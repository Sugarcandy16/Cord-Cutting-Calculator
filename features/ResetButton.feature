Feature: User
  As a channel watcher
  So that I don’t need to click selected channels again to remove them from my list
  I want to add a button to the “Select the Channels” dropdown

 Scenario: Pressed Channels Reset Button 
     Given I am on the calculator page
     And the following channels exist:
    | name  |       
    | CNN  |
    | ABC |
    | BBC |
     Then I check "CNN" in "Must Have"
     When I press "Reset Must Have"
     Then I should see all "Must have channels" unchecked
     
 Scenario: Pressed "Would Like" channels' reset button
     Given I am on the calculator page
     Then I check "ABC" in "Like To Have"
     And I reset "Would like to have channels"
     Then I should see all "Would like to have channels" unchecked
     
 Scenario: Pressed "OK to have" channels' reset button     
     Given I am on the calculator page
     Then I check "BBC" in "OK To Have"
     And I reset "OK to have channels"
     Then I should see all "OK to have channels" unchecked
     