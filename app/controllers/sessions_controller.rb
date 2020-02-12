class SessionsController < ApplicationController
# skip_before_action :authorized, only: [:new, :create, :welcome]


  def authorized
    redirect_to '/login' unless logged_in?
  end

  def new
    #login
  end

  def create
    @user = User.find_by(:username => params[:session][:username])
    # binding.pry
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      # binding.pry
      redirect_to user_path(@user)
    else
      # flash[:alert] = 'Invalid email/password combination'
      redirect_to new_user_path
    end
  end

  def delete
    # User.find(session[:user_id]).destroy
    # session[:user_id] = nil
    # redirect_to '/login'
    session.clear
    redirect_to '/login'
  end

  private

  def user_params
    params.require(:sessions).permit(:username, :password)
  end
end
