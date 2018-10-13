class AddColorVariantIdToProducts < ActiveRecord::Migration[5.1]
  def change
  	add_reference :products, :color_variant
  end
end
