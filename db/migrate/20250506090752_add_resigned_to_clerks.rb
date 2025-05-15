class AddResignedToClerks < ActiveRecord::Migration[8.0]
  def change
    add_column :clerks, :resigned, :boolean, default: false, null: false
  end
end
