class FeaturedImagesController < ApplicationController
  def index
    @new_image = FeaturedImage.new
    @grouped_images = FeaturedImage.all.in_groups(3)
  end

  def create
    @new_image = FeaturedImage.new(params[:featured_image])
    respond_to do |format|
      if @new_image.save
        format.html{redirect_to featured_images_path, notice: "Added image!"}
      else
        format.html{render :index}
      end
    end
  end

  def destroy
  end
end
