class AddStateToProfiles < ActiveRecord::Migration[5.1]
  def change
  	add_column :profiles, :state, :string
  end
end
