class ModifyStatusColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :routes, :status_id, :state
    change_column_default :routes, :state, from: 1, to: 0
    rename_column :documents, :status_id, :status
    change_column_default :documents, :status, from: 1, to: 0
  end
end
