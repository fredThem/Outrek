class CreateRecommendedItemLabels < ActiveRecord::Migration[6.1]
  def change
    create_table :recommended_item_labels do |t|
      t.references :activity, null: false, foreign_key: true
      t.references :label, null: false, foreign_key: true

      t.timestamps
    end
  end
end
