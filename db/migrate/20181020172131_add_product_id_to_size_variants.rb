class AddProductIdToSizeVariants < ActiveRecord::Migration[5.1]
  def change
  	add_reference :size_variants, :product
  end
end
