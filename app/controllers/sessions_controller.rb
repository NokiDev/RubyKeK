def new
end

def create
	user=User.authenticate(params[:email], params[:password])
	if user
		session[:user_id]=user.username
		
	else
		flash.now.alert = "invalid email or password"
	end
end

def destroy
	session[:user_id] = nil
end
