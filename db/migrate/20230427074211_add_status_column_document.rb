class AddStatusColumnDocument < ActiveRecord::Migration[7.0]
  def change
    add_reference :documents, :status, foreign_key: true, default: 1
  end
end
