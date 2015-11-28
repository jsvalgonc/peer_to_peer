Feature: Consultar Conta - 3
  In order to see my account movements 
  As a Investor
  I want to view my account
  
Scenario:Consultar conta
  Given there's a investor named "Jose Silva" 
  Given there's a movement of 12345 in "Jose Silva" account
  Given I am not authenticated 
  Given I am authenticated as "Jose Silva"
  Given I am on the page Consultar Conta for "Jose Silva"
  Then I should see "12345"
  
  