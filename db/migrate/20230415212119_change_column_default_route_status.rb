class ChangeColumnDefaultRouteStatus < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:routes, :status_id, 1)
  end
end
