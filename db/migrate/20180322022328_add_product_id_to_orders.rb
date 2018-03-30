class AddProductIdToOrders < ActiveRecord::Migration[5.1]
  def change
  	add_reference :orders, :product
  end
end
