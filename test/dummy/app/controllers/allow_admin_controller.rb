class AllowAdminController < ApplicationController
  before_action :authenticate_user!
  only_allow :admin, to: [:index]
  def index
    render 'index'
  end
end
