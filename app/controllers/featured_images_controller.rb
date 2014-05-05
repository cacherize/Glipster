class FeaturedImagesController < ApplicationController
  def index
    @new_image = FeaturedImage.new
    @images = FeaturedImage.all
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
    @image = FeaturedImage.find(params[:id])
    respond_to do |format|
      if @image.destroy
        format.html{redirect_to featured_images_path, notice: 'Removed image!'}
      else
        format.html{redirect_to featured_images_path, alert: 'Unable to remove image.'}
      end
    end
  end
end
