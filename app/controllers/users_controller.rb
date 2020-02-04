class UsersController < ApplicationController

skip_before_action :authorized, only: [:new, :create] #allows the two methods to skip the authorized method requirement

  def new
    @user = User.new
  end

  def create
    #signup
    @user = User.new(user_params)

    session[:user_id] = @user.id

    redirect_to '/welcome'
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params[:user])
      redirect_to @user
    else
      render :action => 'edit'
    end
  end

  def delete
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :action => 'new'
  end

  private
  def user_params
    params.require(:user).permit(:username, :password_digest)
  end
end
