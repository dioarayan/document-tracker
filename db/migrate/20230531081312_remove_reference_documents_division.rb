class RemoveReferenceDocumentsDivision < ActiveRecord::Migration[7.0]
  def change
    remove_reference(:documents, :divisions)
  end
end
