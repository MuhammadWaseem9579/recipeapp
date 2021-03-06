class RecipesController < ApplicationController
	before_action :set_recipe, only: [:edit,:update,:show]
	before_action :require_user, except: [:index,:show]
	before_action :require_same_user, only: [:edit,:update,:delete]

	def index
		@recipes = Recipe.paginate(page: params[:page], per_page: 3)
		# @recipes = Recipe.all
	end

	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.new(recipe_params)
		@recipe.chef = current_chef
		if @recipe.save
			redirect_to recipe_path(@recipe)
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		
		if @recipe.update(recipe_params)
			redirect_to recipe_path(@recipe)
		else
			render 'edit'
		end
	end

	def destroy
		if Recipe.find(params[:id]).destroy
			redirect_to recipes_path
		else
			render 'show'
		end
	end

	private

	def set_recipe
		@recipe = Recipe.find(params[:id])
	end

		def recipe_params
			params.require(:recipe).permit(:name,:description,ingridiant_ids: [])
		end

		def require_same_user
			if current_chef != @recipe.chef && !current_chef.admin
				flash[:danger] = "You can only delete your own recipes"
				redirect_to recipes_path
			end
		end

end