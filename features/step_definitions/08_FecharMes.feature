Feature: Register Project - 4
  In order to collect instalements 
  As a Manager
  I want to close the month and calculate instalements
  
Scenario:Register Project
  Given there's a entrepreneur named "Maria Guedes" with user "maria.guedes@teste.com"
  Given there's a project named "Arrumar Carros" by "Maria Guedes"
  Given there's a parameter for "CurrentMonth" with value "01-01-2016"
  Given I am not authenticated 
  Given I am authenticated as a Financial Manager
  Given I am on the main page for a manager
  When I follow "Fechar Mês" 
  Then I should see "Mes Fechado"
  When In line "Arrumar carros" I press "Prestações"
  Then I should see "1000"
  
  