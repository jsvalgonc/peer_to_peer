Feature: Investir - 6
  In order to invest 
  As a Investor
  I want to choose a project 

Scenario:Invest
  Given there's a investor named "Antonio Silva" with user "a.silva@teste.com" 
  Given there's a movement of 1000 in "Antonio Silva" account
  Given I am not authenticated 
  Given I am authenticated as "a.silva@teste.com" with password "password"
  Given I am on the page Consultar Conta for "Antonio Silva"
  Then I should see "€1,000.00"
  Given there's a entrepreneur named "Jose Guedes" with user "jose.guedes@teste.com" 
  Given there's a project named "Arrumar Carros" by "Jose Guedes"
  Given I am not authenticated 
  Given I am authenticated as "a.silva@teste.com" with password "password"
  Given I am on the Selecionar Projecto for "Antonio Silva"
  When In line "Arrumar Carros" I press "Selecionar"
  Then I should see "Nova Transacção"
  When fill in "deal_value" with "50"
  And  I press "Registar"
  Then I should see "Interesse Registado"
  Then I should see "950"