class ApplicationController < ActionController::Base
#  skip_before_filter :current_user
  before_filter :require_user
  protect_from_forgery

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]   
    # if @current_user.nil?
    #   @current_user = User.find(session[:user_id]) if session[:user_id]
    # end
  end
  helper_method :current_user
  
  def require_user
    if current_user
      return true
    else
       redirect_to root_url
    end
  end
    

end
