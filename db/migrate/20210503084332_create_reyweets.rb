class CreateReyweets < ActiveRecord::Migration[6.1]
  def change
    create_table :reyweets do |t|

      t.timestamps
    end

    add_column :reyweets, :user_id, :integer
    add_index :reyweets, :user_id
    add_column :reyweets, :yweet_id, :integer
    add_index :reyweets, :yweet_id
  end
end
