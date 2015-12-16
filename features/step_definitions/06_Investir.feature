Feature: Investir - 6
  In order to invest 
  As a Investor
  I want to choose a project 

Scenario:Invest

  Given there's a movement of 1000 in "Antonio Silva" account
  Given I am on the page Consultar Conta for "Antonio Silva"
  Then I should see "1000"
  Given there's a entrepreneur named "Jose Guedes" 
  Given there's a project named "Arrumar Carros" by "Jose Guedes"
  Given I am not authenticated 
  Given I am authenticated as a Financial Manager
  #Given I am authenticated as "Antonio Silva"
  Given I am on the Selecionar Projecto for "Antonio Silva"
  When In line "Arrumar Carros" I press "Selecionar"
  Then I should see "Investimento Selecionado"
  When fill in "deal_value" with "50"
  And  I press "Registar"
  Then I should see "Interesse Registado"
  Then I should see "950"