class AddRouteFromColumnRoute < ActiveRecord::Migration[7.0]
  def change
    add_column :routes, :route_from, :int
  end
end
