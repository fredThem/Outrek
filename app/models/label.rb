class Label < ApplicationRecord
  has_many :items
  has_many :recommended_item_labels
  has_many :checklist_items

  validates :name, presence: true
  validates :category, presence: true
end
