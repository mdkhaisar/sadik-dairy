class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.references :customer, null: false, foreign_key: true
      t.integer :milk_total

      t.timestamps
    end
  end
end
