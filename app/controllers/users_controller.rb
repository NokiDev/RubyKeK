class UsersController < ApplicationController

  #See route file to link function to page
  def index #show all user GET
    @user = User.all
  end

  def show #show one user GET
    @user = User.find(params[:id])
  end

  def new #
    @user = User.find(params[:id])
  end

  def create #Create new user and save it POST
    @user = User.new(user_params)
    if @user.save #true ou false
      redirect_to root_url
    else
      redirect_to :back
    end
  end

  private

  def user_params #Check Params for creating a user
    params.require(:user).permit(:name)  # Means that params require user var and allow use of a variable name
    #todo see doc on params
  end

end