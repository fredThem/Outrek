class Activity < ApplicationRecord
  belongs_to :trip, through: :trip_activities
  validates :name, presence: true
end
