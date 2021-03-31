class ChecklistItem < ApplicationRecord
  belongs_to :checklist
  belongs_to :label

  validates :checked, inclusion: { in: [true, false] }
  # validates :status, presence: true
end
