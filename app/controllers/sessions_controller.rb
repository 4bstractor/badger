class SessionsController < ApplicationController
  skip_before_filter :authenticate!, :only => [:new, :create]

  def new
  end

  def create
    # Try to find the user by email first
    user = User.find_by_email(params[:email])
    # Try the username if not found by email
    unless user
      user = User.find_by_username(params[:email])
    end

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged In!"
    else
      redirect_to sign_in_url, :notice => "Invalid Email Or Password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged Out!"
  end
end
