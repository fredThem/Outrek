class ChecklistItem < ApplicationRecord
  belongs_to :checklist
  belongs_to :label
  has_many :duties, dependent: :destroy
  has_many :users, through: :duties
  
  validates :checked, inclusion: { in: [true, false] }
  # validates :status, presence: true
end
