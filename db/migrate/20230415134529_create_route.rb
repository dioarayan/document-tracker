class CreateRoute < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.belongs_to :document
      t.belongs_to :status
      t.belongs_to :user
      t.string :remarks
      t.timestamps
    end
  end
end
