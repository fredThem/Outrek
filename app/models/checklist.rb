# == Schema Information
#
# Table name: checklists
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  trip_id    :bigint           not null
#
# Indexes
#
#  index_checklists_on_trip_id  (trip_id)
#
# Foreign Keys
#
#  fk_rails_...  (trip_id => trips.id)
#
class Checklist < ApplicationRecord
  belongs_to :trip
  has_many :checklist_items, dependent: :destroy
  has_many :labels, through: :checklist_items
  has_many :duties, through: :checklist_items, dependent: :destroy
end
