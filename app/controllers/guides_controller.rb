class GuidesController < ApplicationController
  def index
    @guides = User.where(guide: true)
  end

  def new
    @guide = User.find(session[:user_id])
  end

end
