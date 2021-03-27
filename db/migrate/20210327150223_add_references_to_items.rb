class AddReferencesToItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :items, :user, index: true
    add_reference :items, :label, index: true
  end
end
