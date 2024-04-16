class DropAction < ActiveRecord::Migration[7.0]
  def change
    drop_table :actions
  end
end
