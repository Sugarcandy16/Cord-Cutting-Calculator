Feature: Signing with Google
  
  As a user
  I want to signin with my email account
  So that I want to save my preferences
  
  Scenario: recover my password
    Given I am on the login page
    When I select "Forgot password?"
    Then I should be on the password_resets page
    Given I am on the password_resets page
    When I fill in "Email" with "test@test.com"
    And I press "Reset Password"
    Then I should be on home page
    Then I should see "E-mail sent with password reset instructions."
    
  Scenario: login as user
    Given I am on the signup page
    When I fill in "Email" with "tes@test.com"
    And I fill in "Password" with "tes123pass"
    And I fill in "Confirmation" with "tes123pass"
    And I uncheck "Sign up as admin"
    And I press "Create my account"
    Then I should be on the user page
    And I should see "Sign up success!" 
    Given I am on the login page
    When I fill in "Email" with "tes@test.com"
    And I fill in "Password" with "tes123pass"
    And I press "Login"
    Then I should be on the user page
    Given I am on the login page
    When I fill in "Email" with "test@test.com"
    And I fill in "Password" with "test12pass"
    And I press "Login"
    And I should see "Invalid email/password combination"
