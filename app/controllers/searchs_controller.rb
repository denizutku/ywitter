class SearchsController < ApplicationController
    before_action :authenticate_user!


    before_action do
        @users = User.all.limit(3)
        @trends = ActsAsTaggableOn::Tag.most_used(5)
    end

    def search
        @parameter = params[:search].downcase
        @users = User.all.where("lower(username) like :search", search: "%#{@parameter}%")
        @yweets = Yweet.all.where("lower(yweet) like :search", search: "%#{@parameter}%")
    end
end
  