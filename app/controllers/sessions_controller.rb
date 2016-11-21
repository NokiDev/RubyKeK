class SessionsController < ApplicationController
	def new
	end

	def create
		user=User.authenticate(params[:email], params[:password])
		#Find the matching User !
		if user
			session[:user_id]=user.id
		end
	end

	def destroy
		session[:user_id] = nil
	end

end