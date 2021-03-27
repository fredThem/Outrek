class Activity < ApplicationRecord
  has_many :recommended_item_labels
  has_many :trip_activities

  validates :name, presence: true
end
