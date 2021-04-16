class CreateYweets < ActiveRecord::Migration[6.1]
  def change
    create_table :yweets do |t|
      t.string :yweet

      t.timestamps
    end
  end
end
