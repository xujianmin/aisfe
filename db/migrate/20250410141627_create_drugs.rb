class CreateDrugs < ActiveRecord::Migration[8.0]
  def change
    create_table :drugs do |t|
      t.string :product_name
      t.string :nmc

      t.timestamps
    end
  end
end
