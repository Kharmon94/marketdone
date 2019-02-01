class CreateColorVariants < ActiveRecord::Migration[5.1]
  def change
    create_table :color_variants do |t|
      t.string :color
      t.integer :product_id
      t.timestamps
    end
  end
end
