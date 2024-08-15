class RenameColumnsRoutes < ActiveRecord::Migration[7.0]
  def change
    rename_column :routes, :route_from, :origin_user_id
    remove_column :routes, :destination_user_id_id
  end
end
