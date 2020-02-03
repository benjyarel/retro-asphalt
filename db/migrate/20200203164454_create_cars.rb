class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.integer :power
      t.string :address
      t.integer :year
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
