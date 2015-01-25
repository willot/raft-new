class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def new
    @user = User.new
  end

  def create
    @user= User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "You created an account"
    else
      @error = "Sign up failed: Try again."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :age, :email, :bio, :guide, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
