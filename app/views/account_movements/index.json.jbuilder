json.array!(@account_movements) do |account_movement|
  json.extract! account_movement, :id, :user_id, :value_date, :movement_date, :value
  json.url account_movement_url(account_movement, format: :json)
end
