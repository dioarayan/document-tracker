class CreateActions < ActiveRecord::Migration[7.0]
  def change
    create_table :actions do |t|
      t.string 'actionName'
      t.timestamps
    end
  end
end
