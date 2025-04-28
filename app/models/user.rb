class User < ApplicationRecord
  validates :email_address, presence: true, uniqueness: true

  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :stores
  has_many :visits, dependent: :destroy
  has_many :clerks, through: :stores
  has_many :drugs, through: :stores
  has_many :stock_change_logs

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
