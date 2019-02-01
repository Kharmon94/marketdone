class AddBusinessCategoriesToBusiness < ActiveRecord::Migration[5.1]
  def change
  	add_reference :businesses, :business_category
  end
end
