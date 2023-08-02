class AddColunToRestaurant < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :name, :string
    add_column :restaurants, :address, :string
    add_column :restaurants, :description, :string
  end
end
