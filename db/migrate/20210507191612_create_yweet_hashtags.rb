class CreateYweetHashtags < ActiveRecord::Migration[6.1]
  def change
    create_table :yweet_hashtags do |t|

      t.timestamps
    end
  end
end
