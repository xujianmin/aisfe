class Store < ApplicationRecord
  validates :name, :level, :address, presence: true
end
