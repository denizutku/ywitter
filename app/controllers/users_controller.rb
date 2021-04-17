class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
    end

    def follow
        @user = User.find(params[:id])
        Relationship.create(follower_id:current_user.id, followed_id:@user.id)
        redirect_to get_user_profile, alert: "Followed!"
    end
end
  