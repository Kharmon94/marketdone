class DropFollows < ActiveRecord::Migration[5.2]
  def change
  	drop_table :follows
  	drop_table :likes
  	drop_table :mentions
  end
end
