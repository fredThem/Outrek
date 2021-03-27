class Activity < ApplicationRecord
  has_many :recommended_item_labels
  belongs_to :trip, through: :trip_activities

  validates :name, presence: true
end
