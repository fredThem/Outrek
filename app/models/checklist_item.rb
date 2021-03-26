class ChecklistItem < ApplicationRecord
  belongs_to :checklist
  belongs_to :label

  validates :checked, presence: true
  # validates :status, presence: true
end
