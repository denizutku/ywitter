class Yweet < ApplicationRecord

    after_commit :create_hashtags, on: :create

    belongs_to :user
    has_many :likes

    has_many :reyweets
    has_many :users, through: :reyweets

    validates_presence_of :yweet

    acts_as_taggable_on :tags

    def extract_hashtags
        yweet.to_s.scan(/#\w+/).map{|name| name.gsub("#", "")}
    end

    def create_hashtags
        extract_hashtags.each do |name|
            tag_list.add(name)
            save
        end
    end

end
