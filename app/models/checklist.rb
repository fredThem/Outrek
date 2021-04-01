class Checklist < ApplicationRecord
  belongs_to :trip
  has_many :checklist_items, dependent: :destroy

end
