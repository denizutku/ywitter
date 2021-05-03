class AddReplyToYweets < ActiveRecord::Migration[6.1]
  def change
    add_column :yweets, :reply_to, :integer
  end
end
