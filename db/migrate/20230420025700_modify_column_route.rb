class ModifyColumnRoute < ActiveRecord::Migration[7.0]
  def change
    change_table(:routes) do |t|
       t.references :receiving_user, foreign_key: { to_table: 'users'} 
    end
  end
end
