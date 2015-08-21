class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.text :overview
      t.text :description
      t.string :picture

      t.timestamps
    end
  end
end
