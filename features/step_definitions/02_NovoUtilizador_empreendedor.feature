Feature: Registo de Novo Utilizador Empreendedor- 2
  In order to star using the application
  As a new user
  I want to register 

Scenario:Registo Inicial
  
  Given there's a envitation for "jose.silva@teste.com" with value "0000000000000000001"
  Given I am not authenticated
  Given I am on the "Convite para registo" with envitation "0000000000000000001"
  When fill in "user_email" with "UserDeTeste@teste.com"
  When fill in "user_email" with "UserDeTeste@teste.com"
  When fill in "user_password" with "12345678"
  When fill in "user_password_confirmation" with "12345678"
  When I choose button "user_role_entrepreneur"
  And  I press "Registar"
  Then I should see "Novo Empreendedor"
  When fill in "entrepreneur[full_name]" with "Jose Silva"
  When fill in "entrepreneur_address" with "Rua do Lá Vai Um, n.1, 456º Frente"
  When fill in "entrepreneur_zip_code" with "1000-000"
  When fill in "entrepreneur_town" with "Lisboa"
  When fill in "entrepreneur_country" with "Portugal"
  When fill in "entrepreneur_fiscal_number" with "12345678"
  And  I press "Registar Empreendedor"
  Then I should see "successfully created"