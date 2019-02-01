class ReturnLikeCountToProducts < ActiveRecord::Migration[5.1]
  def change
  	add_column :products, :likees_count, :integer, :default => 0
  end
end
