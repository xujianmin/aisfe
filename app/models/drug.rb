class Drug < ApplicationRecord
  has_many :stocks
  has_many :stores, through: :stocks

  before_destroy :ensure_not_referenced_by_any_stock

  private

  def ensure_not_referenced_by_any_stock
    unless stocks.empty?
      errors.add(:base, "此药品还在终端药店有未清零库存。")
      throw :abort
    end
  end
end
