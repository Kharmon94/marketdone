class AddCountryToOrders < ActiveRecord::Migration[5.1]
  def change
  	add_column :orders, :country, :string
  end
end
