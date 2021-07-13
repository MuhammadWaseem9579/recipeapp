class ApplicationController < ActionController::Base


	helper_method :current_chef,:logged_in?


	def current_chef
		# debugger
		@current_chef ||= Chef.find(session[:chef_id]) if session[:chef_id]
	end

	def logged_in?
		!!current_chef
	end

	def require_user
		if !logged_in?
			redirect_to login_path
		end
	end
end
