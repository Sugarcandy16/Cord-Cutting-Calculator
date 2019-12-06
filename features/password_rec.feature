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
