class Item < ApplicationRecord
  belongs_to :user
  belongs_to :label

  validates :name, presence: true
end
