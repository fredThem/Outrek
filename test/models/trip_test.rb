# == Schema Information
#
# Table name: trips
#
#  id                :bigint           not null, primary key
#  description       :string
#  destination       :string
#  end_date          :date
#  expected_end_time :time
#  finished          :boolean
#  latitude          :float
#  longitude         :float
#  meetup_time       :time
#  start_date        :date
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :bigint           not null
#
# Indexes
#
#  index_trips_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class TripTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
