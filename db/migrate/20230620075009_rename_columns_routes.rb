class RenameColumnsRoutes < ActiveRecord::Migration[7.0]
  def change
    remove_reference :routes, :destination_user_id, index: false
    rename_column :routes, :destination_user_id, :destination_user_id
    rename_column :routes, :route_from, :origin_user_id
  end
end
