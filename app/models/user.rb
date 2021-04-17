class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :yweets, dependent: :destroy
  has_many :likes 

  acts_as_favoritable
  acts_as_favoritor

  validates_uniqueness_of :username
                                              
end
