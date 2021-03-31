class AddTimeToTrips < ActiveRecord::Migration[6.1]
  def change
    add_column :trips, :meetup_time, :time
    add_column :trips, :expected_end_time, :time
    change_column :trips, :description, :string
  end
end
