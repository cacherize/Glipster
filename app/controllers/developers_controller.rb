class DevelopersController < ApplicationController
	before_filter :authorize, only: [:new, :create, :edit, :update, :destroy]
	def new
		@developer = Developer.new
	end

	def create
		@developer = Developer.new(params[:developer])

		respond_to do |format|
			if @developer.save
				format.html{redirect_to @developer, notice: "Successfully created developer!"}
			else 
				format.html{render :new}
			end
		end
	end

	def index
		@developers = Developer.order(:name).where("lower(name) like ?", "%#{params[:term].downcase}%")
    render json: @developers.map(&:name)
	end

	def show
		@developer = Developer.find(params[:id])
	end

	def edit
		@developer = Developer.find(params[:id])
	end

	def update
		@developer = Developer.find(params[:id])

		respond_to do |format|
			if @developer.update_attributes(params[:developer])
				format.html{redirect_to @developer, notice: "Successfully updated developer!"}
			else
				format.html{render :edit}
			end
		end
	end

	def destroy
		@developer = Developer.find(params[:id])
		
		@developer.update_attribute(:archived_at, Time.now)

		respond_to do |format|
			format.html{redirect_to :back}
		end
	end
end
