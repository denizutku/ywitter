class Yweet < ApplicationRecord
    belongs_to :user
    has_many :likes

    has_many :reyweets
    has_many :users, through: :reyweets

    validates_presence_of :yweet

end
