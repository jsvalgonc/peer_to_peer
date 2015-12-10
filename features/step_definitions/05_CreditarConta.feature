Feature: Creditar Conta - 5
  In order to 
  As a Manager
  I want to credit investor account

Scenario:Creditar Conta

  Given there's a investor named "Jose Silva" 
  
  Given I am not authenticated 

  Given I am authenticated as a Financial Manager
  Given I am on the "Selecionar investidor"
  When fill in "search" with "Jos"
  And  I press "Pesquisar"
  Then I should see "Jose Silva"
  When In line "Jose" I press "Movimentar"
  Then I should see "Novo Movimento em Conta"
  When fill in "account_movement_value" with "100"
  And  I press "Registar"
  Then I should see "successfully created"
  