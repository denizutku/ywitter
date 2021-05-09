class AddImageUrlToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :image_url, :string, :default => "https://lh3.googleusercontent.com/proxy/tPFNKX0WGx7epYdLRqThj1hiwajzhcygr5DgYoMw9MVhv-q1v8fP98bO-kEV2qZzRmlhYEb3wuWEu5xuPXCl8kAPpgID-p31bfb-VjkRGqGIufdjB5slK0hcSzgaso6IEXGQFHOgLUbNRS2JAIB95FApUVRc3X284w"
  end
end
