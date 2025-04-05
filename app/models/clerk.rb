class Clerk < ApplicationRecord
  belongs_to :store

  validates :first_name, :last_name, presence: true

  def fullname
    last_name + first_name
  end
end
