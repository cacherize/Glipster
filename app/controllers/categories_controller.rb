class CategoriesController < ApplicationController
	def new
		@category = Category.new
	end

	def create
		@category = Category.new(params[:category])

		respond_to do |format| 
			if @category.save
				format.html{redirect_to root_path, notice: "Successfully created category!"}
			else
				format.html{render :new}
			end
		end
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])

		respond_to do |format|
			if @category.update_attributes(params[:category])
				format.html{redirect_to root_path, notice: "Successfully updated category!"}
			else 
				format.html{render :edit}
			end
		end
	end
end
