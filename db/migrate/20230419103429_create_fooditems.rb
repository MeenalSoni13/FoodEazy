class CreateFooditems < ActiveRecord::Migration[7.0]
  def change
    create_table :fooditems do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.integer :restaurant_id
      t.timestamps
    end
  end
end
