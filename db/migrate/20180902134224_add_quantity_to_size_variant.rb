class AddQuantityToSizeVariant < ActiveRecord::Migration[5.1]
  def change
  	add_column :size_variants, :quantity, :integer
  end
end
