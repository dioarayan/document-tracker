  class ChangeColumnDefaultRouteAction < ActiveRecord::Migration[7.0]
    def change
      remove_column(:routes, :status_id, type: :integer, default: 1)
      add_column(:routes, :action_id, :integer, default: 1)
    end
  end
