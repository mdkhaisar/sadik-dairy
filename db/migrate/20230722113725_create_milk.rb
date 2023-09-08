class CreateMilk < ActiveRecord::Migration[7.0]
  def change
    create_table :milks do |t|
      t.integer :milk_name
      t.integer :quantity
      t.integer :unit_price
      t.integer :total_price

      t.timestamps
    end
  end
end
