class User < ActiveRecord::Base
  has_many :organized_events, class_name: "Event", foreign_key: "owner_id"
  has_many :engagements
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :name, uniqueness: true
end