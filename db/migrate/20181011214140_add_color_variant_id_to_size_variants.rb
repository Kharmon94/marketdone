class AddColorVariantIdToSizeVariants < ActiveRecord::Migration[5.1]
  def change
  	add_reference :size_variants, :color_variant 
  end
end
