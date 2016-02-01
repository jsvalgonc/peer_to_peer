Feature: Close Month - 8
  In order to collect instalements 
  As a Manager
  I want to close the month and calculate instalements
  
Scenario:Close Month
  Given there's a parameter for "CurrentMonth" with value "01-01-2016"
  Given there's a parameter for "InstallmentProcessNumber" with value "1"
  Given there's a entrepreneur named "Maria Guedes" with user "maria.guedes@teste.com"
  Given there's a project named "Arrumar Carros" by "Maria Guedes"
  Given there's a parameter for "CurrentMonth" with value "01-01-2016"
  Given I am not authenticated 
  Given I am authenticated as a Financial Manager
  Given I am on the main page for a manager
  When I follow "Fechar Mês" 
  Then I should see "Prestações Calculadas"
  When I follow "Projectos"
  When In line "Arrumar carros" I press "Mostrar"
  Then I should see "1000"
  
  