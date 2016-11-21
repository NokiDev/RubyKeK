class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #include CanCan::ControllerAdditions

  #rescue_from CanCan::AccessDenied do |exception|
  #  redirect_to root_url, :alert => exception.message
  #end

  def login_required
    redirect_to('/') if current_user.blank?
  end
  
  helper_method :current_user

	private

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

end
