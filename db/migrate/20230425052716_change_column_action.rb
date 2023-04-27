class ChangeColumnAction < ActiveRecord::Migration[7.0]
  def change
    remove_column :actions, :actionName

    add_column :actions, :forwarded, :boolean, default: false
    add_column :actions, :received, :boolean, default: false
    add_column :actions, :released, :boolean, default: false
    add_column :actions, :processing, :boolean, default: false
  end
end
