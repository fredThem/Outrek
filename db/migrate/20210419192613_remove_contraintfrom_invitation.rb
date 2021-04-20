class RemoveContraintfromInvitation < ActiveRecord::Migration[6.1]
  def change
    change_column :invitations, :user_id, :bigint, :null => true, :optional => true
  end
end
