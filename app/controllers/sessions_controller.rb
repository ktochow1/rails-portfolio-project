class SessionsController < ApplicationController
# skip_before_action :authorized, only: [:new, :create, :welcome]
  def new
    render :new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      flash[:message] = "Sorry, please try again."
      redirect_to '/login'
    end
  end

  def oauth_login
    @user = User.from_omniauth(auth_hash)
    @user.name = auth_hash['info']['name']
    @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user.id)
  end

  def delete
    session.clear
    redirect_to '/login'
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

end
