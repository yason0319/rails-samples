class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.bool :login
      t.string :name
      t.string :passwd
      t.string :email

      t.timestamps
    end
  end
end
