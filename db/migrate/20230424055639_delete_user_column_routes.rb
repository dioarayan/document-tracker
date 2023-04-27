class DeleteUserColumnRoutes < ActiveRecord::Migration[7.0]
  def change
    remove_column(:routes, :user_id)    
  end
end
