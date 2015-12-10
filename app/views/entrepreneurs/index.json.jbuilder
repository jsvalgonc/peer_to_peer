json.array!(@entrepreneurs) do |entrepreneur|
  json.extract! entrepreneur, :id, :full_name, :address, :zip_code, :town, :country, :fiscal_number
  json.url entrepreneur_url(entrepreneur, format: :json)
end
