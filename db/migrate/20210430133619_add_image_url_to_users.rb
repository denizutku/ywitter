class AddImageUrlToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :image_url, :string, :default => "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvd_qqLUun_iSnWsdj3dWww3gp6EoTrh9t_PjPIvWdS_SKmgxA0zfJBOr-BZlQr0fs2F8&usqp=CAU"
  end
end
