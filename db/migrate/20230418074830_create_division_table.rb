class CreateDivisionTable < ActiveRecord::Migration[7.0]
  def change
    create_table :divisions do |t|
      t.string :name
      t.timestamps
    end
    
    create_table :sections do |t|
      t.belongs_to :division
      t.string :name
      t.timestamps
    end

  end
end
