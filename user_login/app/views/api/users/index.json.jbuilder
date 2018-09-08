json.set! :users do
  json.array! @users do |user|
    json.extract! user, :id, :name, :login, :passwd, :email, :created_at, :updated_at
  end
end