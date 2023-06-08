class CreateHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.string :name
      t.string :address
      t.text :description
      t.string :city
      t.text :photo
      t.integer :night_price

      t.timestamps
    end
  end
end
