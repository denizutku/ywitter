class IndexController < ApplicationController
  def home
    if user_signed_in?
      redirect_to logged_in_root_url
    end
  end
end
