class AddHashtagIdYweetIdToYweetHashtags < ActiveRecord::Migration[6.1]
  def change

    add_column :yweet_hashtags, :hashtag_id, :integer
    add_index :yweet_hashtags, :hashtag_id
    add_column :yweet_hashtags, :yweet_id, :integer
    add_index :yweet_hashtags, :yweet_id
  end
end
