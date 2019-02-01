class RemoveTags < ActiveRecord::Migration[5.1]
  def change
  	drop_table :tags
  	drop_table :taggings
  	drop_table :profiles
  end
end
