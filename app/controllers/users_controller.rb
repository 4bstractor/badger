class UsersController < ApplicationController
  skip_before_filter :authenticate!, :only => [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      # May remove if registration is added
      session[:user_id] = @user.id
      redirect_to root_url, :notice => "Signed Up!"
    else
      render "new"
    end
  end
end
