class AddVarientsToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :color, :string
    add_column :orders, :size, :string
  end
end
