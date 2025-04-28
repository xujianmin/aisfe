class StockChangeLog < ApplicationRecord
  belongs_to :stock
  belongs_to :user

  validates_presence_of :field, :old_value, :new_value
end
