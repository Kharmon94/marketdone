class RemoveQuantityFromSizeVariants < ActiveRecord::Migration[5.1]
  def change
  	remove_column :size_variants, :quantity
  end
end
