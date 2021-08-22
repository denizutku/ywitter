class ApplicationController < ActionController::Base


  layout :layout

  def after_sign_in_path_for(resource)
    '/home'
  end
  
  def after_sign_out_path_for(resource)
    '/'
  end

  private

  def layout
    if current_user
      'application'
    else
      'sessions'
    end
  end
end
