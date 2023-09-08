class AddRecordToMilk < ActiveRecord::Migration[7.0]
  def change
     add_reference :milks, :record, null: false, foreign_key: true
  end
end
