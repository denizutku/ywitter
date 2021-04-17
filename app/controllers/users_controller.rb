class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
    end

    def follow
        @user = User.find(params[:id])
        current_user.favorite(@user)
        redirect_to get_user_profile_path, alert: "Followed!"
    end
end
  