class WelcomeController < ApplicationController
  def index
    @ip = request.ip
    @user_location = Location.new
    @city = @user_location.geo_locate(@ip)
  end
end
