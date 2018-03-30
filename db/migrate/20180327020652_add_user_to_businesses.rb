class AddUserToBusinesses < ActiveRecord::Migration[5.1]
  def change
  	add_reference :businesses, :user
  end
end
