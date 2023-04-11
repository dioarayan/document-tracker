class AddDefaultValueForStatus < ActiveRecord::Migration[7.0]
  def change
    change_column_default :doc_route_infos, :status_id, from: nil, to: 2
  end
end
