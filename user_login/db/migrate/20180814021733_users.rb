class Users < ActiveRecord::Migration[5.2]
  def change
    add_column(:users, :name, :string)
    remove_column(:users, :login)
    add_column(:users, :login, :bool)
  end
end
