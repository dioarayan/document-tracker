class AddReferenceDocumentsDivision < ActiveRecord::Migration[7.0]
  def change
    add_reference :documents, :divisions
  end
end
