Feature: Fechar IPO - 7 
  In order set and IPO as Close 
  As a Manager
  I want to close an IPO 

Scenario:Invest
  Given there's a parameter for "CurrentMonth" with value "01-01-2016"
  Given there's a entrepreneur named "Maria Guedes" with user "maria.guedes@teste.com"
  Given there's a project named "Arrumar Carros" by "Maria Guedes"
  Given I am not authenticated 
  Given I am authenticated as a Financial Manager
  Given I am on the "Projectos" 
  When In line "Arrumar Carros" I press "Edit"
  Then I should see "Projecto - Editar"
  When I chosee "Close" from drop box "project_status"
  When I press "Registar Projecto"
  Then I should see "Project was successfully updated"

