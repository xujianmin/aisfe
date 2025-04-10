class Store < ApplicationRecord
  belongs_to :user
  has_many :clerks, dependent: :destroy

  validates :name, :level, :address, presence: true
end
