
class UsersController < ApplicationController
  def new
    #render user sign in form
  end
  
  def index
    @users = User.all
  end

  def show
    @users = User.find(params[:id])
  end
  
  def create
    @users = User.new(user_params)
    @users.save
    redirect_to controller: 'users', action: 'show', id: @user
  end

private
  def user_params
    params.require(:users).permit(:username,:password,:mail,:first_name,:last_name,:age)
  end

end