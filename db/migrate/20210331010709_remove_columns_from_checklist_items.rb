class RemoveColumnsFromChecklistItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :checklist_items, :checklists_id, :bigint
    remove_column :checklist_items, :labels_id, :bigint
  end
end
