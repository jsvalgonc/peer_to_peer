Feature: Registo de Novo Utilizador como investidor- 1
  In order to star using the application
  As a new user
  I want to register 

Scenario:Registo Inicial
  Given I am not authenticated
  Given I am on the "Registo Inicial"
  When fill in "user_email" with "UserDeTeste@teste.com"
  When fill in "user_password" with "12345678"
  When fill in "user_password_confirmation" with "12345678"
  When I choose button "user_role_investor"
  And  I press "Registar"
  Then I should see "Novo Investidor"
  When fill in "investor[full_name]" with "Jose Silva"
  When fill in "investor_address" with "Rua do Lá Vai Um, n.1, 456º Frente"
  When fill in "investor_zip_code" with "1000-000"
  When fill in "investor_town" with "Lisboa"
  When fill in "investor_country" with "Portugal"
  When fill in "investor_fiscal_number" with "12345678"
  And  I press "Registar Investidor"
  Then I should see "successfully created"