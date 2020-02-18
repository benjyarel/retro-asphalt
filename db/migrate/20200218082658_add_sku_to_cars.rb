class AddSkuToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :sku, :string
  end
end
