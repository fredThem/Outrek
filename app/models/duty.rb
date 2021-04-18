# == Schema Information
#
# Table name: duties
#
#  id                :bigint           not null, primary key
#  status            :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  checklist_item_id :bigint           not null
#  user_id           :bigint           not null
#
# Indexes
#
#  index_duties_on_checklist_item_id  (checklist_item_id)
#  index_duties_on_user_id            (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (checklist_item_id => checklist_items.id)
#  fk_rails_...  (user_id => users.id)
#
class Duty < ApplicationRecord
  belongs_to :user
  belongs_to :checklist_item
end
