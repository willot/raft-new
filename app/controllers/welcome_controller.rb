class WelcomeController < ApplicationController
  def index
    @ip = request.ip
  end
end
