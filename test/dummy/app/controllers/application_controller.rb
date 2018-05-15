class ApplicationController < ActionController::Base
  helper_method :current_user
  def authenticate_user
    current_user
    if @current_user
      return true
    else
      raise "No signed in user"
      return false
    end
  end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
