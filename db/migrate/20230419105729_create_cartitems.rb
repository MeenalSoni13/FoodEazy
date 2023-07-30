class CreateCartitems < ActiveRecord::Migration[7.0]
  def change
    create_table :cartitems do |t|
      t.integer :fooditem_id
      t.integer :cart_id
      t.integer :quantity
      t.timestamps
    end
  end
end
