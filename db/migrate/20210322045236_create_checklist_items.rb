class CreateChecklistItems < ActiveRecord::Migration[6.1]
  def change
    create_table :checklist_items do |t|
      t.references :checklist, null: false, foreign_key: true
      t.references :label, null: false, foreign_key: true
      t.text :detail
      t.boolean :checked
      t.string :status

      t.timestamps
    end
  end
end
