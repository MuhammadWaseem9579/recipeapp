class SessionController < ApplicationController
	def new
		
	end

	def create
		email = params[:session][:email]
		pass = params[:session][:password]
		user = Chef.find_by(email: email)
		if user && user.authenticate(pass)
			session[:chef_id] = user[:id]
			redirect_to root_path
		else
			render 'new'
		end
	end

	def destroy
		session[:chef_id] = nil
		redirect_to login_path
	end
end