class Store < ApplicationRecord
  belongs_to :user
  has_many :clerks, dependent: :destroy
  has_many :stocks, dependent: :destroy
  has_many :drugs, through: :stocks

  validates :name, :level, :address, presence: true
end
