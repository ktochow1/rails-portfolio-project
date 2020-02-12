class UsersController < ApplicationController

# skip_before_action :authorized, only: [:new, :create] #allows the two methods to skip the authorized method requirement

  # def authorized
  #   redirect_to '/welcome' unless logged_in?
  # end


#validation error when saving a list - list needs a user - can't find where validation error is
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to users_path(@user)
    else
      render :new
    end
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
    params.require(:user).permit(:username, :password)
  end

end
