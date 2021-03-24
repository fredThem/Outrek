class AddRefToTripActivity < ActiveRecord::Migration[6.1]
  def change
    add_reference :trip_activities, :trips, index: true
    add_reference :trip_activities, :activities, index: true
  end
end
