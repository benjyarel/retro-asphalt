class AddPriceToCars < ActiveRecord::Migration[5.2]
  def change
    add_monetize :cars, :price, currency: { present: false }
  end
end
