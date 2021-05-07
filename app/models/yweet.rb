class Yweet < ApplicationRecord

    after_commit :create_hashtags, on: :create

    belongs_to :user
    has_many :likes

    has_many :reyweets
    has_many :users, through: :reyweets

    validates_presence_of :yweet

    has_many :yweet_hashtags
    has_many :hashtags, through: :yweet_hashtags

    def extract_hashtags
        yweet.to_s.scan(/#\w+/).map{|name| name.gsub("#", "")}
    end

    def create_hashtags
        extract_hashtags.each do |name|
            hashtags.create(name: name)
        end
    end

end
