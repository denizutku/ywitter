class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_uniqueness_of :username
  validates_presence_of :username
  validates_presence_of :email
  validates_presence_of :encrypted_password

  has_many :yweets, dependent: :destroy
  has_many :likes 

  acts_as_favoritable
  acts_as_favoritor

  has_many :reyweets
  has_many :yweets, through: :reyweets


end
