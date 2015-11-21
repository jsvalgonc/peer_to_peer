Feature: Registo de Novo Investidor - 2
  In order to star using the investing
  As a new user
  I want to complete my register

Scenario:Registo de Investidor
  Given I am a new, authenticated user
  Given I am on the "Registo de Investidor"
  When fill in "investor[full_name]" with "Jose Silva"
  When fill in "investor_address" with "Rua do Lá Vai Um, n.1, 456º Frente"
  When fill in "investor_zip_code" with "1000-000"
  When fill in "investor_town" with "Lisboa"
  When fill in "investor_country" with "Portugal"
  When fill in "investor_fiscal_number" with "12345678"
  And  I press "Registar Investidor"
  Then I should see "successfully created"