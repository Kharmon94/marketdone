class AddSizeToOrders < ActiveRecord::Migration[5.1]
  def change
  	add_column :orders, :size, :string
  end
end
