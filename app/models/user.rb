class User < ApplicationRecord
  validates :email_address, presence: true, uniqueness: true

  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :stores

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
