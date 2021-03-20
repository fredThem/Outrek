class Label < ApplicationRecord
  has_many :items
  has_many :recommended_item_labels

  validates :name, presence: true
  validates :category, presence: true
end
