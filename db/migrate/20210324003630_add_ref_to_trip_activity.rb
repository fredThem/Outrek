class AddRefToTripActivity < ActiveRecord::Migration[6.1]
  def change
    add_reference :trip_activities, :trip, index: true
    add_reference :trip_activities, :activity, index: true
  end
end
