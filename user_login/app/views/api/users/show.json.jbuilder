json.set! :user do
  json.extract! @user, :id, :name, :login, :passwd, :email, :created_at, :updated_at
end