# == Schema Information
#
# Table name: items
#
#  id         :bigint           not null, primary key
#  name       :string
#  weight     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  label_id   :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_items_on_label_id  (label_id)
#  index_items_on_user_id   (user_id)
#
class Item < ApplicationRecord
  belongs_to :user
  belongs_to :label

  validates :name, presence: true
end
