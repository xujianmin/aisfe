class Clerk < ApplicationRecord
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
end
