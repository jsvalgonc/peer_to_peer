json.array!(@projects) do |project|
  json.extract! project, :id, :value, :description, :start_date, :duration, :entrepreneur_id
  json.url project_url(project, format: :json)
end
