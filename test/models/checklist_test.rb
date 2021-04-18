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
require "test_helper"

class ChecklistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
