class RemovePriceToCars < ActiveRecord::Migration[5.2]
  def change
    remove_column :cars, :price
  end
end
