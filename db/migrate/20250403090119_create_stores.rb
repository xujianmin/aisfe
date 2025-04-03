class CreateStores < ActiveRecord::Migration[8.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :level
      t.text :description
      t.string :address

      t.timestamps
    end
  end
end
