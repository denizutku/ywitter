class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :yweets, dependent: :destroy

  has_many :active_relationships, class_name: "Relationshop",
                                  foreign_key: "follower_id",
                                  inverse_of: :follower,
                                  dependent: :destroy

  has_many :passive_relationships, class_name: "Relationshop",
                                  foreign_key: "followed_id",
                                  inverse_of: :followed,
                                  dependent: :destroy
  
  has_many :followings, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
                                              
end
