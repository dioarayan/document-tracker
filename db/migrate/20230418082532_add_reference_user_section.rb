class AddReferenceUserSection < ActiveRecord::Migration[7.0]
  def change
    add_reference(:users, :sections, index: false)
  end
end
