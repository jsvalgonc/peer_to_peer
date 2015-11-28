FactoryGirl.define do
  factory :investor, aliases: [:silva] do
    full_name "Jose Silva"
    address "Rua do Lá Vai Um"
    zip_code "1000"
    town "Lisboa"
    country "Portugal"
    NIF "12345678"
  end
  
  factory :account_movement do
    association :silva, factory: :investor
    value_date Time.now
    movement_date Time.now
    value 1
  end

end
