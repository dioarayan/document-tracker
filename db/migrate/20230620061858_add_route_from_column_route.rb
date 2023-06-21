class AddRouteFromColumnRoute < ActiveRecord::Migration[7.0]
  def change
    add_column :routes, :route_from, :int
    rename_column :routes, :destination_user_id, :destination_user_id
  end
end
