class ChangeColumnDefaultRouteAction < ActiveRecord::Migration[7.0]
  def change
    remove_column(:routes, :status_id, type: :integer, default: 1)
    remove_reference(:routes, :status)
    add_column(:routes, :action_id, :integer, default: 1)
    add_foreign_key(:routes, :actions)
  end
end
