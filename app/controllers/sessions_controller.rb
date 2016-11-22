class SessionsController < ApplicationController
	def new

	end

	def create
		@user=User.authenticate(params[:session][:mail], params[:session][:password])
		#Find the matching User !
		if @user
			session[:user_id]=@user
			redirect_to concerts_url
		end
	end

	def destroy
		session[:user_id] = nil
	end

end