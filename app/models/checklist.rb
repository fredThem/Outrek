class Checklist < ApplicationRecord
  belongs_to :trip
  has_many :checklist_items, dependent: :destroy
  has_many :labels, through: :checklist_items
end
