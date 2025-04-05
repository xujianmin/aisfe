class Store < ApplicationRecord
  has_many :clerks, dependent: :destroy
  validates :name, :level, :address, presence: true
end
