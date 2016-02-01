json.array!(@invitations) do |invitation|
  json.extract! invitation, :id, :user_id, :inv_key, :used_date, :used, :email
  json.url invitation_url(invitation, format: :json)
end
