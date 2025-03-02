class AddAssignedUserToArticles < ActiveRecord::Migration[8.0]
  def change
    add_column :articles, :assigned_user_id, :integer
    add_foreign_key :articles, :users, column: :assigned_user_id
    add_index :articles, :assigned_user_id
  end
end
