class Event < ActiveRecord::Base
  # indexes on archived, private
  # attr_accessible :image, :remote_image_url
  has_many :taggings
  has_many :tags, through: :taggings

  belongs_to :category

  has_many :engagements
  has_many :attendees, through: :engagements, class_name: "User"
  mount_uploader :image, ImageUploader

  default_scope -> {order(:start_date)}

  scope :future,    -> { where("end_date > ?", DateTime.now) }
  scope :archived,  -> { where("end_date < ?", DateTime.now) }
  scope :visible,   -> { where(secret: false) }
  scope :hidden,    -> { where(secret: true) }

  # dunnolol
  # scope :visible_attendees, -> {engagements.visible.joins(:user)}
end
