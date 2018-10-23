class AddColorToOrders < ActiveRecord::Migration[5.1]
  def change
  	add_column :orders, :color, :string
  end
end
