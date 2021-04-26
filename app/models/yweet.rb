class Yweet < ApplicationRecord
    belongs_to :user
    has_many :likes

    validates_presence_of :yweet

end
