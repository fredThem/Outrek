class Trip < ApplicationRecord
  belongs_to :user
  has_one :checklist
  has_many :invitations
  has_many :trip_activities
  has_many :activities, through: :trip_activities

  validates :destination, presence: true
  validates :description, presence: true,
                          length: { maximum: 500, too_long: "%{count} characters is the maximum allowed" }
  validates :start_date, presence: true

  validates :meetup_time, presence: true

  validates :expected_end_time, presence: true
  geocoded_by :destination
  after_validation :geocode, if: :will_save_change_to_destination?
end
