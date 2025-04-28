class CreateStockChangeLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :stock_change_logs do |t|
      t.references :stock, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :field
      t.integer :old_value
      t.integer :new_value

      t.timestamps
    end
  end
end
