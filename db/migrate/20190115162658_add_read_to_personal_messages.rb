class AddReadToPersonalMessages < ActiveRecord::Migration[5.1]
  def change
  	add_column :personal_messages, :read, :boolean, default: false
  end
end
