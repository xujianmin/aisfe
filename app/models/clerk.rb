class Clerk < ApplicationRecord
  before_validation :blank_customer_preference_to_nil
  
  belongs_to :store

  validates :first_name, :last_name, presence: true

  # enum customer_preference: {
  #   A: "A",
  #   B: "B",
  #   C: "C"
  # }, _prefix: true

  def fullname
    last_name + first_name
  end

  private

  def blank_customer_preference_to_nil
    self.customer_preference = nil if customer_preference.blank?
  end
end
