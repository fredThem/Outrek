# == Schema Information
#
# Table name: trips
#
#  id                :bigint           not null, primary key
#  description       :string
#  destination       :string
#  end_date          :date
#  expected_end_time :time
#  finished          :boolean
#  latitude          :float
#  longitude         :float
#  meetup_time       :time
#  start_date        :date
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :bigint           not null
#
# Indexes
#
#  index_trips_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
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
