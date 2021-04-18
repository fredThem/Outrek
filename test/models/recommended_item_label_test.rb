# == Schema Information
#
# Table name: recommended_item_labels
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  activity_id :bigint           not null
#  label_id    :bigint           not null
#
# Indexes
#
#  index_recommended_item_labels_on_activity_id  (activity_id)
#  index_recommended_item_labels_on_label_id     (label_id)
#
# Foreign Keys
#
#  fk_rails_...  (activity_id => activities.id)
#  fk_rails_...  (label_id => labels.id)
#
require "test_helper"

class RecommendedItemLabelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
