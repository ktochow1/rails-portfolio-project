class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.nil? == false
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/login'
    end
  end

  def show
    @user = User.find_by(params[:id])
  end

  def edit
    if logged_in?
      @user = User.find(params[:id])
    else
      redirect_to '/login'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, list_ids: [])
  end

end
