class CreateStatus < ActiveRecord::Migration[7.0]
  def change
    create_table :statuses do |t|
      t.string "statusName"
      t.timestamps
    end
  end
end
