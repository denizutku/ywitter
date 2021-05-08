class UsersController < ApplicationController
    before_action :set_user, only: %i[ show follow unfollow ]

    def show
        @yweets = Yweet.where(user_id:params[:id]).includes(:user, :likes)
        @users = User.all.limit(3)
        @trends = ActsAsTaggableOn::Tag.most_used(5)
    end

    def follow
        current_user.favorite(@user)
        redirect_to get_user_profile_path, alert: "Followed!"
    end

    def unfollow
        current_user.unfavorite(@user)
        redirect_to get_user_profile_path, alert: "Followed!"
    end

    private

    def set_user
        @user = User.find(params[:id])
    end
end
  