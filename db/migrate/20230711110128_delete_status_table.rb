class DeleteStatusTable < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :documents, :statuses
    drop_table :statuses, force: :cascade
    change_column_default :routes, :status_id, 1
  end
end
