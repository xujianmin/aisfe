class Session < ApplicationRecord
  belongs_to :user

  # 会话过期时间（30分钟）
  SESSION_EXPIRY = 30.minutes

  def expired?
    return false if last_activity_at.nil?
    last_activity_at < SESSION_EXPIRY.ago
  end

  def touch_last_activity
    update_column(:last_activity_at, Time.current)
  end
end
