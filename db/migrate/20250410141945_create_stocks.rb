class CreateStocks < ActiveRecord::Migration[8.0]
  def change
    create_table :stocks do |t|
      t.integer :quantity
      t.integer :distribution_quantity
      t.references :store, null: false, foreign_key: true, index: true
      t.references :drug, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
