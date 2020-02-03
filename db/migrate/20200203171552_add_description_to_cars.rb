class AddDescriptionToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :description, :text
  end
end
