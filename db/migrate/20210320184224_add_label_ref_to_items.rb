class AddLabelRefToItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :items, :label, null: false, foreign_key: true
  end
end
