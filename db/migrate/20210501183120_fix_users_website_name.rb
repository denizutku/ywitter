class FixUsersWebsiteName < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :website_string, :website
  end
end
