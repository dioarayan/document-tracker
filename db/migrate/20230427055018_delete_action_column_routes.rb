class DeleteActionColumnRoutes < ActiveRecord::Migration[7.0]
  def change
    remove_column :routes, :action_id, type: :integer
  end
end
