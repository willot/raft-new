class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
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




  def update
    @guide = User.find(session[:user_id])
    @location = Location.find_by(city: (params[:user][:location]).downcase)

    if @location
      @guide.update(params_guide.merge(location: @location))
      redirect_to @guide
    else
      render 'guides/new'
    end

    end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :age, :email, :bio, :guide, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def params_guide
    params.require(:user).permit(:guide)
  end

end
