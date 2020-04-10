module ApplicationHelper

  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    redirect_to '/login' unless logged_in?
  end


  def format_value(value)
    value ||= 'N/A'
  end

end
