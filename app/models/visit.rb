class Visit < ApplicationRecord
  belongs_to :user
  belongs_to :store
  has_rich_text :content

  validates :content, presence: true
  validates :user_id, presence: true
  validates :store_id, presence: true
end
