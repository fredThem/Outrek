# == Schema Information
#
# Table name: trip_activities
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  activity_id :bigint
#  trip_id     :bigint
#
# Indexes
#
#  index_trip_activities_on_activity_id  (activity_id)
#  index_trip_activities_on_trip_id      (trip_id)
#
class TripActivity < ApplicationRecord
  belongs_to :trip
  belongs_to :activity
end
