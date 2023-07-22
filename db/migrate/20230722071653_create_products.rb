class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :quantity
      t.float :unit_price
      t.float :total_price

      t.timestamps
    end
  end
end
