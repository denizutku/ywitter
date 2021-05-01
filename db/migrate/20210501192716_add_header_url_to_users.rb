class AddHeaderUrlToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :header_url, :string
  end
end
