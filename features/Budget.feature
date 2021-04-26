Feature: User
  
  As a channel watcher
  Currently the budget does not specify whether it is monthly or yearly
  Specify that near the budget field
    
  Scenario: Changing from monthly to yearly budget
    Given I am on the calculator
    Then I enter a budget
    And I choose "Yearly"
    Then I press calculate 
    And I should see "Yearly" budgets

 Scenario: Changing from yearly to monthly budget
    Given I am on the calculator
    Then I enter a budget
    And I choose "Yearly"
    Then I choose "Monthly"
    Then I press calculate 
    And I should see "Monthly" budgets
