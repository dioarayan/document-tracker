class AddDoctypeIdToDocument < ActiveRecord::Migration[7.0]
  def change
    add_column :documents, :doctype_id, :int
  end
end
