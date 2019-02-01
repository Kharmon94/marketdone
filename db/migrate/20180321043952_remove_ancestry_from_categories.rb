class RemoveAncestryFromCategories < ActiveRecord::Migration[5.1]
  def change
  	remove_column :categories, :ancestry
  end
end
