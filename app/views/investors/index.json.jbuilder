json.array!(@investors) do |investor|
  json.extract! investor, :id, :full_name, :address, :zip_code, :town, :country, :NIF, :fiscal_number
  json.url investor_url(investor, format: :json)
end
