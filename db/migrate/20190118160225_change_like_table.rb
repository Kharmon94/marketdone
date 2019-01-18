class ChangeLikeTable < ActiveRecord::Migration[5.1]
  def change
  	remove_column :likes, :liker_type
  	remove_column :likes, :liker_id
  	remove_column :likes, :likeable_type
  	remove_column :likes, :likeable_id
  	add_reference :likes, :user
  	add_reference :likes, :product
  end
end
