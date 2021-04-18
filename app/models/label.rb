# == Schema Information
#
# Table name: labels
#
#  id         :bigint           not null, primary key
#  category   :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Label < ApplicationRecord
  has_many :items
  has_many :recommended_item_labels, dependent: :destroy
  has_many :checklist_items, dependent: :destroy

  validates :name, presence: true
  validates :category, presence: true
end
