Feature: Generate Invitations - 9
  In order start inviting new investors/entrepreneurs
  As a Manager
  I want to  to generate invitations for agents

Scenario:Gerar Convites - 9
  Given there's a agent named "Jose Santos" with user "jose.santos@teste.com"
  Given there's a parameter for "CurrentMonth" with value "01-01-2016"
  Given I am not authenticated 
  Given I am authenticated as an Administrator
  Given I am on the "main page for a manager"
  When I follow "Agentes"
  When  I fill in "quantity" with "10" 
  When  In line "Jose" I press "Gerar Convites"
  Then I should see "Convites Gerados com sucesso"
  
  Given I am not authenticated 
  Given I am authenticated as "jose.santos@teste.com" with password "password"
  Then I should see "Agente-Página Principal"
  When  I press "Convidar"
  When  I fill "email" with "jsvalgonc@hotmail.com"
  When  I press "Enviar"
  Then I should see "Convite enviado com sucesso"
  
  

  
  

  