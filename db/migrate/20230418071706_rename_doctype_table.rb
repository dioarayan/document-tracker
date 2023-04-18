class RenameDoctypeTable < ActiveRecord::Migration[7.0]
  def change
    rename_table('doctypes', 'categories')
    rename_column('documents', 'doctype_id', 'category_id' )
  end
end
