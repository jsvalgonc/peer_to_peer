Feature: Consultar Conta - 3
  In order to see my account movements 
  As a Investor
  I want to view my account
  
Scenario:Consultar conta
  Given there's a investor named "Jose Lopes" 
  Given there's a movement of 12345 in "Jose Lopes" account
  Given I am not authenticated 
  Given I am authenticated as "Jose Lopes"
  Given I am on the page Consultar Conta for "Jose Lopes"
  Then I should see "12345"
  
  