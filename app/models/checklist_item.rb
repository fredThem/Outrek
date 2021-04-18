# == Schema Information
#
# Table name: checklist_items
#
#  id           :bigint           not null, primary key
#  checked      :boolean
#  detail       :text
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  checklist_id :bigint           not null
#  label_id     :bigint           not null
#
# Indexes
#
#  index_checklist_items_on_checklist_id  (checklist_id)
#  index_checklist_items_on_label_id      (label_id)
#
# Foreign Keys
#
#  fk_rails_...  (checklist_id => checklists.id)
#  fk_rails_...  (label_id => labels.id)
#
class ChecklistItem < ApplicationRecord
  belongs_to :checklist
  belongs_to :label
  has_many :duties, dependent: :destroy
  has_many :users, through: :duties
  
  validates :checked, inclusion: { in: [true, false] }
  # validates :status, presence: true
end
