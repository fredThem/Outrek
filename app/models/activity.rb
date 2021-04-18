# == Schema Information
#
# Table name: activities
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Activity < ApplicationRecord
  has_many :recommended_item_labels
  has_many :trip_activities

  validates :name, presence: true
end
