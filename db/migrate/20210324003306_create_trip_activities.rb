class CreateTripActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :trip_activities do |t|

      t.timestamps
    end
  end
end
