Feature: Registo de Novo Utilizador - 1
  In order to star using the application
  As a new user
  I want to register 

Scenario:Registo Inicial
  Given I am not authenticated
  Given I am on the "Registo Inicial"
  When fill in "user_email" with "UserDeTeste@teste.com"
  When fill in "user_password" with "12345678"
  When fill in "user_password_confirmation" with "12345678"
  And  I press "Registar"
  Then I should see "Bemvindo"