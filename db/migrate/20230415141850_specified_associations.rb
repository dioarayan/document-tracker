class SpecifiedAssociations < ActiveRecord::Migration[7.0]
  def change
   add_index(:documents, :user_id)
   add_index(:documents, :doctype_id)
  end
end
