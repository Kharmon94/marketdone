class DropOrderItems < ActiveRecord::Migration[5.1]
  def change
  	drop_table :order_items
  end
end
