class AddCustomerPreferenceToClerks < ActiveRecord::Migration[8.0]
  def change
    add_column :clerks, :customer_preference, :string
  end
end
