FactoryGirl.define do
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
  
 #Investidor
 
  factory :user_lopes, class: User do
    email "jose.lopes@teste.com"
    role :investor
    password "secretpass"
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
  
  factory :account_movement do
    association :investor, factory: :lopes
    value_date Time.now
    movement_date Time.now
    value 1
  end

  factory :guedes, class: Entrepreneur do
    full_name "Jose Guedes"
    address "Rua do Lá Vai Um"
    zip_code "1000"
    town "Lisboa"
    country "Portugal"
    fiscal_number "12345678"
  end
  
  factory :entrepreneur do
    full_name "Jose Guedes"
    address "Rua do Lá Vai Um f2"
    zip_code "1000"
    town "Lisboa"
    country "Portugal"
    fiscal_number "12345678"
  end
  
  factory :ArrumarCarros, class: Project do
    association :entrepreneur, factory: :guedes
    value 1000
    description "Arrumar Carros"
    start_date Time.now
    duration 48
  end

end
