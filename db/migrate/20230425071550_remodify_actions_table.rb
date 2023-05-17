class RemodifyActionsTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :actions, :forwarded, :boolean, default: false
    remove_column :actions, :received, :boolean, default: false
    remove_column :actions, :released, :boolean, default: false
    remove_column :actions, :processing, :boolean, default: false

    add_column :actions, :actionName, :string
  end
end
