FactoryGirl.define do
  
 #Investidor
  
  factory :investor do
    full_name "Jose Silva"
    address "Rua do Lá Vai Um"
    zip_code "1000"
    town "Lisboa"
    country "Portugal"
    NIF "12345678"
  end

  factory :silva,  class: Investor do
    full_name "Jose Silva"
    address "Rua do Lá Vai Um"
    zip_code "1000"
    town "Lisboa"
    country "Portugal"
    NIF "12345678"
  end
  
  factory :user_lopes, class: User do
    email "jose.lopes@teste.com"
    role :investor
    password "password"
    agent 'false'
  end

  factory :lopes, class: Investor do
    full_name "Jose Lopes"
    address "Rua do Lá Vai Um"
    zip_code "1000-000"
    town "Lisboa"
    country "Portugal"
    fiscal_number 1
    NIF "12345678"
    association :user, factory: :user_lopes
  end

#Entrepreneur

  factory :user_guedes, class: User do
    email "jose.guedes@teste.com"
    role :entrepreneur
    password "password"
  end

  factory :guedes, class: Entrepreneur do
    full_name "Jose Guedes"
    address "Rua do Lá Vai Um"
    zip_code "1000-000"
    town "Lisboa"
    country "Portugal"
    fiscal_number "12345678"
    association :user, factory: :user_guedes
  end
  
  factory :entrepreneur do
    full_name "Jose Guedes"
    address "Rua do Lá Vai Um f2"
    zip_code "1000-000"
    town "Lisboa"
    country "Portugal"
    fiscal_number "12345678"
  end
  
#account movement
  factory :account_movement do
    association :investor, factory: :lopes
    value_date Time.now
    movement_date Time.now
    value 1
  end

#Project  
  factory :ArrumarCarros, class: Project do
    association :entrepreneur, factory: :guedes
    value 1000
    description "Arrumar Carros"
    start_date Time.now
    duration 36
    interest_rate 0.12
    installment 1000
    status :subscription
  end

#Parameters
  factory :app_parameter do
    parameter "CurrentMonth"
    value "01-01-2016"
  end
  
#Invitation
  factory :invitation do
    association :user, factory: :user_lopes
    inv_key "00000000001"
    used_date ''
    used false
    email 'jose.silva@teste.com'
    created_at Time.now
    updated_at Time.now
    registered false
  end

end
