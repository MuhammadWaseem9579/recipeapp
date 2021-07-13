class IngridiantsController < ApplicationController

	def index
		@ingridiants = Ingridiant.paginate(page: params[:page],per_page: 3)
	end

	def new
		@ingridiant = Ingridiant.new
	end

	def create
		@ingridiant = Ingridiant.new(ingridiant_params)
		if @ingridiant.save
			flash[:notice] = "Succeded"
			redirect_to ingridiants_path
		else
			flash[:danger] = "Unable to add Ingridiant"
			render 'new'
		end
	end

	def show
		
	end

	def edit
		@ingridiant = Ingridiant.find(params[:id])
	end

	def update
		@ingridiant = Ingridiant.find(params[:id])
		if @ingridiant.update(ingridiant_params)
			redirect_to ingridiants_path
		else
			render 'edit'
		end
	end

	def destroy
		@ingridiant = Ingridiant.find(params[:id])
		if @ingridiant.destroy
			redirect_to ingridiants_path
		else
			flash[:danger] = "Unable to delete somethin went wrong"
			render 'index'
		end
	end

	private

		def ingridiant_params
			params.require(:ingridiant).permit(:name)
		end

end