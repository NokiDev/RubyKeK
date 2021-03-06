
class UsersController < ApplicationController
  def new
    #render user sign in form
  end
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

  end
  
  def create
    @user = User.new(user_params)
    @user.enabled = false
    @user.activation_key = '%010d' % rand(10 ** 10)
    if @user.save
      UserMailer.confirm_email(@user).deliver_later
      redirect_to action: :confirm_mail, controller: :users, user_id: @user.id
    else
      redirect_to :new_user
    end
  end

  def confirm_mail
    @user = User.find(params[:user_id])
    if @user
      @user
    end
    #Throw 404 there
  end

  def user_activate
    @user = User.find(activation_key: params[:key])
    if @user
      @user.enabled = true
      @user.save
      session[:user_id] = @user
      redirect_to controller: 'users', action:'show', id: @user
    end
  end


private
  def user_params
    params.require(:users).permit(:username,:password,:email, :last_name, :first_name, :address, :phone_number, :age)
  end

end