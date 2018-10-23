class RemoveColorVariantIdFromSizeVariants < ActiveRecord::Migration[5.1]
  def change
  	remove_column :size_variants, :color_variant_id
  end
end
