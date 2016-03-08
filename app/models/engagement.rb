class Engagement < ActiveRecord::Base
  # indexes on user_id, event_id, private
  belongs_to :user
  belongs_to :event

  scope :visible, -> {where(secret: false)}
  scope :hidden, -> {where(secret: true)}
end
