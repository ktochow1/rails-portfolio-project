class ApplicationController < ActionController::Base
  # before_action :current_user #macro required authorized method to run before any other action is taken
  # helper_method :current_user, :logged_in?, :authorized
  include ApplicationHelper
  include UserHelper
end
