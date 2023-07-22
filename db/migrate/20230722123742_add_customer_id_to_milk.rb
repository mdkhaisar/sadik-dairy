class AddCustomerIdToMilk < ActiveRecord::Migration[7.0]
  def change
    add_reference :milks, :customer, null: false, foreign_key: true
  end
end
