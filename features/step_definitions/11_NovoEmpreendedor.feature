Feature: Registo de Novo Empreendedor - 11
  In order to start presenting projects
  As a new user
  I want to complete my register as an entrepreneur

Scenario:Entrepreneur Register
  Given I am a new, authenticated user
  Given I am on the "Registo de Empreendedor"
  When fill in "entrepreneur[full_name]" with "Jose Silva"
  When fill in "entrepreneur_address" with "Rua do Lá Vai Um, n.1, 456º Frente"
  When fill in "entrepreneur_zip_code" with "1000-000"
  When fill in "entrepreneur_town" with "Lisboa"
  When fill in "entrepreneur_country" with "Portugal"
  When fill in "entrepreneur_fiscal_number" with "12345678"
  And  I press "Registar Empreendedor"
  Then I should see "successfully created"