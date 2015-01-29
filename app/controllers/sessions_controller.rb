class SessionsController < ApplicationController

  def new
    #render partial: 'form'
  end

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
      # render json: 'afegrhjj'
    else
      @error = "Incorrect Username or Password. Please try again."
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
