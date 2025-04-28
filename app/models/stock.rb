class Stock < ApplicationRecord
  belongs_to :store
  belongs_to :drug
  has_many :stock_change_logs, dependent: :destroy

  before_save :track_changes

  TRACKED_FIELDS = %w[quantity distribution_quantity].freeze

  private

  def track_changes
    return unless Current.user

    TRACKED_FIELDS.each do |field|
      if send("#{field}_changed?")
        stock_change_logs.build(
          user: Current.user,
          field: field,
          old_value: send("#{field}_was"),
          new_value: send(field)
        )
      end
    end
  end
end
