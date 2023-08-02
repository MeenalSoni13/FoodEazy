class RemoveColFromRestaurant < ActiveRecord::Migration[7.0]
  def change
    remove_column :restaurants, :description, :string
    remove_column :restaurants, :name, :string
    remove_column :restaurants, :address, :string
  end
end
