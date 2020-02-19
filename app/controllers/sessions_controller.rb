class SessionsController < ApplicationController
# skip_before_action :authorized, only: [:new, :create, :welcome]


  def authorized
    redirect_to '/login' unless logged_in?
  end

  def new
    #login
  end

  def create
    # binding.pry
    @user = User.find_by(:username => params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.now[:error] = 'Invalid email/password combination'
      render :new
    end
  end

  def delete
    session.clear
    redirect_to '/login'
  end

  private

  def user_params
    params.require(:sessions).permit(:username, :password)
  end
end
