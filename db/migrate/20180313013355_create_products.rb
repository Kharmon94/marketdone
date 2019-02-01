class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :description
      t.integer :price
      t.decimal :shipping_cost, :precision => 8, :scale => 2 
      t.boolean :sold
      t.string :condition

      t.timestamps
    end
  end
end
