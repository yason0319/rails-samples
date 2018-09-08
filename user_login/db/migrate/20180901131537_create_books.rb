class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :page
      t.integer :price
      t.binary :cover

      t.timestamps
    end
  end
end
