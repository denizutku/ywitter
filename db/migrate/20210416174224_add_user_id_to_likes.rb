class AddUserIdToLikes < ActiveRecord::Migration[6.1]
  def change
    add_column :likes, :user_id, :integer
    add_index :likes, :user_id

    add_column :likes, :yweet_id, :integer
    add_index :likes, :yweet_id
  end
end
