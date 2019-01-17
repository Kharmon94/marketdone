class AddFolloweesCountToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :followees_count, :integer, :default => 0
  end
end
