class AddStatusToDutyDuties < ActiveRecord::Migration[6.1]
  def change
    add_column :duties, :status, :string
  end
end
