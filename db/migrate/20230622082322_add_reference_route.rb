class AddReferenceRoute < ActiveRecord::Migration[7.0]
  def change
      remove_column :routes, :origin_user_id, :integer
    change_table(:routes) do |t|
      t.references :destination_user, foreign_key: { to_table: 'users'} 
      t.references :origin_user, foreign_key: { to_table: 'users'} 
    end
  end
end
