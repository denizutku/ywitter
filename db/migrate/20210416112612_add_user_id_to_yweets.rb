class AddUserIdToYweets < ActiveRecord::Migration[6.1]
  def change
    add_column :yweets, :user_id, :integer
    add_index :yweets, :user_id

    create_join_table :followers, :followeds, table_name: :relationships do |t|
      t.index [:follower_id, :followed_id], unique: true
      t.index :followed_id
    end

  end
end
