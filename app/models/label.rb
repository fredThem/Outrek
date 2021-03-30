class Label < ApplicationRecord
  has_many :items
  has_many :recommended_item_labels, dependent: :destroy
  has_many :checklist_items, dependent: :destroy

  validates :name, presence: true
  validates :category, presence: true
end
