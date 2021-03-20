class RecommendedItemLabel < ApplicationRecord
  belongs_to :activity
  belongs_to :label
end
