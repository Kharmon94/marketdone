class AddShippingLastNameToOrders < ActiveRecord::Migration[5.2]
  def change
  	add_column :orders, :shipping_last_name, :string
  end
end
