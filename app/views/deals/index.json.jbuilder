json.array!(@deals) do |deal|
  json.extract! deal, :id, :investor_id, :project_id, :value, :confirmed, :confirmation_date
  json.url deal_url(deal, format: :json)
end
