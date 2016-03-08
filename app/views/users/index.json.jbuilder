json.array!(@users) do |user|
  json.extract! user, :id, :name, :crypted_password, :salt
  json.url user_url(user, format: :json)
end
