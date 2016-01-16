json.array!(@installments) do |installment|
  json.extract! installment, :id, :project_id, :value, :reference_date, :interest, :capital, :status, :process_number
  json.url installment_url(installment, format: :json)
end
