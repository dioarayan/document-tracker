class AdUserIdToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :documents, :user_id, :init
  end
end
