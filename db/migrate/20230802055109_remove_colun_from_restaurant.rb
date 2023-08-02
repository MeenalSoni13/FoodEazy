class RemoveColunFromRestaurant < ActiveRecord::Migration[7.0]
  def change
    remove_column :restaurants, :index, :string
  end
end
