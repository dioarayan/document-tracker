class CreateDocRouteInfo < ActiveRecord::Migration[7.0]
  def change
    create_table :doc_route_infos do |t|
      t.integer "document_id"
      t.integer "status_id"
      t.integer "user_id"
      t.timestamps
    end
  end
end
