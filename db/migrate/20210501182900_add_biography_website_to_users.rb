class AddBiographyWebsiteToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :biography, :string
    add_column :users, :website_string, :string
  end
end
