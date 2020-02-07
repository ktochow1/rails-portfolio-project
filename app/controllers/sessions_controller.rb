class SessionsController < ApplicationController
# skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
    #login
  end

  def create
    @user = User.find_by(:username => params[:username])
    # binding.pry
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      redirect_to users_path(@user)
    end
  end

  def delete
    User.find(session[:user_id]).destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
