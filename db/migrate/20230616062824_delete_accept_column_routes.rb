class DeleteAcceptColumnRoutes < ActiveRecord::Migration[7.0]
  def change
    remove_column :routes, :accept
  end
end
