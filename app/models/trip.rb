class Trip < ApplicationRecord
  belongs_to :user
  has_one :checklist
  has_many :invitations
  has_many :trip_activities
  has_many :activities, through: :trip_activities

  validates :destination, presence: true
  validates :description, presence: true, length: { maximum: 500, too_long: "%{count} characters is the maximum allowed" }
end
