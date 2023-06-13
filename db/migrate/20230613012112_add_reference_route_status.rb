class AddReferenceRouteStatus < ActiveRecord::Migration[7.0]
  def change
    add_reference(:routes, :status, default: 1)
    add_column(:routes, :accept, :boolean, default: false)
  end
end
