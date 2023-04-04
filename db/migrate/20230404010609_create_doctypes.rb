class CreateDoctypes < ActiveRecord::Migration[7.0]
  def change
    create_table :doctypes do |t|
      t.string "name"
      t.timestamps
    end
  end
end
