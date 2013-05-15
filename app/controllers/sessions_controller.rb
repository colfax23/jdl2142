class SessionsController < ApplicationController
  skip_before_filter :require_user, :only => [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])    
#    if User.authenticate(params[:email], params[:password])
    if User.authenticate(params[:session][:email], params[:session][:password])
      session[:user_id] = user.id
      redirect_to '/home',  :notice => "Logged in!"
    else
      render "new"
    end  
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end