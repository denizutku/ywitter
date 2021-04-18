class SearchsController < ApplicationController
    def search
        @parameter = params[:search].downcase
        @users = User.all.where("lower(username) like :search", search: "%#{@parameter}%")
        @yweets = Yweet.all.where("lower(yweet) like :search", search: "%#{@parameter}%")
    end
end
  