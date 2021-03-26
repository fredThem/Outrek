class Activity < ApplicationRecord
  has_many :recommended_item_labels

  validates :name, presence: true
end
