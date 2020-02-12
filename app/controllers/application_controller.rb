class ApplicationController < ActionController::Base
  before_action :current_user #macro required authorized method to run before any other action is taken
  helper_method :current_user, :logged_in?


  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def authorized
    redirect_to '/login' unless logged_in?
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    redirect_to '/login' unless logged_in?
  end
end
