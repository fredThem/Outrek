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

  validates :meetup_time, presence: true,
                          timeliness: { type: :time, before: '12:00' }

  validates :expected_end_time, presence: true,
                                timeliness: { type: :time, before: '12:00' }
  # geocoded_by :destination
  # after_validation :geocode
end
