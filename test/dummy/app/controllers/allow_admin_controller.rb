class AllowAdminController < ApplicationController
  only_allow :admin, to: [:index]
  def index
    render 'index'
  end
end
