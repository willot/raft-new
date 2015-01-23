class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user= User.new(user_params)
    if @user.save
      redirect_to @user, notice: "You created an account"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :age, :email, :bio, :guide, :password)
  end

end
