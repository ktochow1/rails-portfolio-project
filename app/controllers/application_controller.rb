class ApplicationController < ActionController::Base
  # before_action :authorized #macro required authorized method to run before any other action is taken
  helper_method :current_user, :logged_in?


  def current_user
    @current_user ||= User.find_by(id: session[:user])
    # User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user != nil?
  end

  def authorized
    redirect_to '/welcome' unless logged_in?
  end
end
