class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionHelper
  #include CanCan::ControllerAdditions

  #rescue_from CanCan::AccessDenied do |exception|
  #  redirect_to root_url, :alert => exception.message
  #end

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  #rescue_from User::NotAuthorized, with: :user_not_authorized



private

  def record_not_found
    render plain: "404 Not Found", status: 404
  end

  def not_authorized
    redirect_to('/') if current_user.blank?
  end

  helper_method :current_user

	private

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

end
