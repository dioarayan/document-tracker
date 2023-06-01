class AddColumnDocumentsDivision < ActiveRecord::Migration[7.0]
  def change
    add_reference(:documents, :division)
  end
end
