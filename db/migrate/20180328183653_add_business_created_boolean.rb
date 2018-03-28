class AddBusinessCreatedBoolean < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :business_created, :boolean
  end
end
