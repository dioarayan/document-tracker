class RenameDocRouteInfoTable < ActiveRecord::Migration[7.0]
  def change
    rename_table :doc_route_infos, :record
  end
end
