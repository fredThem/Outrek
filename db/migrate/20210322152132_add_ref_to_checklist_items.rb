class AddRefToChecklistItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :checklist_items, :checklists, index: true
    add_reference :checklist_items, :labels, index: true
  end
end
