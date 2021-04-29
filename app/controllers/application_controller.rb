class ApplicationController < ActionController::Base

    layout :layout

  private

  def layout

    if current_user
      'application'
    else
      'sessions'
    end
  end
end
