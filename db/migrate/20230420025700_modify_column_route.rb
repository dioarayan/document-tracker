class ModifyColumnRoute < ActiveRecord::Migration[7.0]
  def change
    change_table(:routes) do |t|
       t.references :destination_user_id, foreign_key: { to_table: 'users'} 
    end
  end
end
