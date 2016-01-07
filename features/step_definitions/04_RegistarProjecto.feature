Feature: Register Project - 4
  In order to register a Project 
  As a Entrepreneur
  I want to insert all the necessary information
  
Scenario:Register Project
  Given there's a entrepreneur named "Maria Guedes" with user "maria.guedes@teste.com"
  Given I am not authenticated 
  Given I am authenticated as "maria.guedes@teste.com" with password "password"
  Given I am on the main entrepreneur page for "Maria Guedes" 
  When  I press "Criar Projecto"
  Then I should see "Novo Projecto"
  When I fill in "project_value" with "1000000"
  When I fill in "project_description" with "Arrumar carros"
  When I select "01/01/2015" as the project "start_date" date
  When I fill in "project_duration" with "48"
  When I press "Registar Projecto" 
  Then I should see "Projecto Registado"
  
  