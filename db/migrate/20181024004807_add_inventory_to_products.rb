class AddInventoryToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :inventory, :integer
  end
end
