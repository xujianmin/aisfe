class StockChangeLog < ApplicationRecord
  belongs_to :stock
  belongs_to :user

  validates_presence_of :field, :old_value, :new_value

  def get_diveation
    new_value - old_value
  end
end
