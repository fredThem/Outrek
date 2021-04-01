class Trip < ApplicationRecord
  belongs_to :user
  has_one :checklist, dependent: :destroy
  has_many :checklist_items, through: :checklist, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_many :trip_activities, dependent: :destroy
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
