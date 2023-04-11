class PluralizeRecordTable < ActiveRecord::Migration[7.0]
  def change
    rename_table :record, :records
  end
end
