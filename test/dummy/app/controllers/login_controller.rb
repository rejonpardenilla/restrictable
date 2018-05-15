class LoginController < ApplicationController
  def create
    user = User.find_by_email params['email']
    if user.present?
      session[:user_id] = user.id
    else
      raise "User not found"
    end
    redirect_to '/'
  end
end
