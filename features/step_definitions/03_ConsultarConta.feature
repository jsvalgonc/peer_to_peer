Feature: Consultar Conta - 3
  In order to see my account movements 
  As a Investor
  I want to view my account
  
Scenario:Consultar conta
  #Given there's a user named "jose.santos@teste.com"
  Given there's a investor named "Jose Santos" with user "jose.santos@teste.com"
  Given there's a movement of 123 in "Jose Santos" account
  Given I am not authenticated 
  Given I am authenticated as "jose.santos@teste.com" with password "password"
  Given I am on the page Consultar Conta for "Jose Santos"
  Then I should see "€123.00"
  