class RemoveOriginUserIdRoute < ActiveRecord::Migration[7.0]
  def change
    remove_reference :routes, :origin_user_id, type: :int
    remove_foreign_key :routes, :users, name: :origin_user_id
    remove_column :routes, :origin_user_id, type: :int
    remove_column :routes, :origin_user_id_id, type: :int
  end
end
