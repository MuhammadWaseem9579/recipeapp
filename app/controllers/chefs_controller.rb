class ChefsController < ApplicationController

	before_action :set_chef, only: [:edit,:show,:update,:destroy]
	before_action :require_user, only: [:edit,:uodate,:destroy]

	def index
		@chefs = Chef.all
	end

	def new
		@chef = Chef.new
	end

	def create
		@chef = Chef.new(chef_params)
		if @chef.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @chef.update(chef_params)
			redirect_to chef_path(@chef)
		else
			render 'edit'
		end
	end

	def destroy
		if @chef.destroy
			redirect_to chefs_path
		else
			render 'show'
		end
	end

	private

	def set_chef
		@chef = Chef.find(params[:id])
	end
	
	def chef_params
		params.require(:chef).permit(:name,:email,:password,:password_confirmation)
	end

	def require_same_user
		if @chef != current_chef && !current_chef.admin
			flash[:danger] = "You can only delete your own Account"
			redirect_to chef_path(current_chef)
		end
	end

end