class CreateClerks < ActiveRecord::Migration[8.0]
  def change
    create_table :clerks do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.text :remark
      t.belongs_to :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
