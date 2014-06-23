class CategoriesController < ApplicationController
	before_filter :authorize, only: [:new, :create, :edit, :update]
	def index
    @featured_category_games = []
		Category.all.each do |category|
      if category.featured_category_games.present?
        @featured_category_games << {category => category.featured_category_games.map(&:game)}
      end
    end
	end

	def show
		@category = Category.find(params[:id])
    @featured_games = Game.find(@category.featured_category_games_ids)

		games = @category.games.order('created_at DESC')
		@new_games = games.last(15)
		@random_game = [games.sample]
		@searched_games = games.search(params[:search])
    @categories_games = @searched_games.paginate(per_page: 18, page: params[:page])
    
    @group_games = @categories_games.size > 9
    @grouped_games = @categories_games.in_groups(2, false) if @group_games
	end

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
