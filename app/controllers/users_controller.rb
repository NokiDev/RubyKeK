
class UsersController < ApplicationController
  def new
    render :action => "new"
  end

  def index
    render :action => "display"
  end

  def show
    @users = User.find(params[:id])
  end
  
  def create
    @users = User.new(ok)
    @users.save
    redirect_to @users
  end

private
  def ok
    params.require(:users).permit(:username,:password,:mail,:first_name,:last_name,:age)
  end

end