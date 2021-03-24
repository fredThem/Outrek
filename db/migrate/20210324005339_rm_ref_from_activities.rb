class RmRefFromActivities < ActiveRecord::Migration[6.1]
  def change
    remove_reference :activities, :trip, foreign_key: true
  end
end
