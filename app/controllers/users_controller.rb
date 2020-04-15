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
    @user = User.find_by(id: params[:id])
    if session[:user_id] == @user.id
      @user

    else
      redirect_to '/login'
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
      @user = User.find_by(id: params[:id])
      @user.update(user_params)
      @user.email = params[:user][:email]
      @user.name = params[:user][:name]
      # binding.pry
      @user.save
      redirect_to @user
  end

  def most_lists
    # binding.pry
    @user = User.most_lists
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, list_ids: [])
  end

end
