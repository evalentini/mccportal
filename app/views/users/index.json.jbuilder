json.array!(@users) do |user|
  json.extract! user, :id, :email, :role, :encrypted_password, :salt
  json.url user_url(user, format: :json)
end
