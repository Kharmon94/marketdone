class CreateBusinesses < ActiveRecord::Migration[5.1]
  def change
    create_table :businesses do |t|
      t.string :title
      t.text :description
      t.string :address
      t.string :city
      t.string :email
      t.text :hours
      t.string :number
      

      t.timestamps
    end
  end
end
