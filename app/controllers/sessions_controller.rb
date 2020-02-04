class SessionsController < ApplicationController
# skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
    #login
  end

  def create
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id

      redirect_to user_path(@user)
    else
      redirect_to '/welcome'
    end
  end

  def delete
  end

  def welcome
  end

  def require_login
  end

end
