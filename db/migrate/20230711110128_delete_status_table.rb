class DeleteStatusTable < ActiveRecord::Migration[7.0]
  def change
    remove_reference :documents, :statuses
    remove_index :documents, :status_id
    remove_foreign_key :documents, :statuses
    remove_reference :routes, :statuses
    remove_index :routes, :status_id
    drop_table :statuses, force: :cascade
    change_column_default :routes, :status_id, 1
  end
end
