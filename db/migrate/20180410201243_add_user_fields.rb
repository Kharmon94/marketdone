class AddUserFields < ActiveRecord::Migration[5.1]
  def change
  	add_column  :users, :username, :string 
  	add_column  :users, :first_name, :string 
    add_column  :users, :last_name, :string 
    add_column  :users, :street_address, :string 
    add_column  :users, :city, :string 
    add_column  :users, :zipcode, :string 
  end
end
