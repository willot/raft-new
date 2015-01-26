class GuidesController < ApplicationController
  def index
    @guides = User.where(guide: true)
  end
end
