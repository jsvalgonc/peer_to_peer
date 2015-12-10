Feature: Fechar IPO - 7 
  In order set and IPO as Close 
  As a Manager
  I want to close an IPO 

Scenario:Invest

  Given there's a project named "Arrumar Carros" by "Jose Guedes"
  Given I am not authenticated 
  Given I am authenticated as a Financial Manager
  Given I am on the "Projectos"
  When In line "Arrumar Carros" I press "Edit"
  Then I should see "Editar Projecto"
  When I chosee "Close" from drop box "project_status"
  When I press "Update Project"
  Then I should see "close"

