class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.float :milk_total
      t.float :product_total
      t.float :total_amount
      t.float :paid_amount
      t.float :balance

      t.timestamps
    end
  end
end
