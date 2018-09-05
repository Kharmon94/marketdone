class CreateSizeVariants < ActiveRecord::Migration[5.1]
  def change
    create_table :size_variants do |t|
      t.string :size
      t.integer :color_variant_id
      t.timestamps
    end
  end
end
