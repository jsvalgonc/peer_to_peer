Feature: Creditar Conta - 5
  In order to 
  As a Manager
  I want to credit investor account

Scenario:Creditar Conta
  Given I am authenticated as a Manager
  Given I am on the "Creditar Conta"
  When fill in "NIF" with "12345678"
  And  I press "Consultar"
  Then I should see "Jose Silva"
  When fill in "Montante a Creditar" with "100"
  And  I press "Creditar"
  Then I should see "Saldo=100"
  