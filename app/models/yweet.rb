class Yweet < ApplicationRecord
    belongs_to :user
    has_many :likes

    has_many :reyweets
    has_many :users, through: :reyweets

    validates_presence_of :yweet

    has_many :yweet_hashtags
    has_many :hashtags, through: :yweet_hashtags

end
