class RemoveOriginUserIdRoute < ActiveRecord::Migration[7.0]
  def change
    remove_column :routes, :origin_user_id, type: :int
  end
end
