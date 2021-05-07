class Hashtag < ApplicationRecord
    has_many :yweet_hashtags
    has_many :yweets, through: :yweet_hashtags
end
