class FeaturedImagesController < ApplicationController
  before_filter :authorize
  def index
    @new_image = FeaturedImage.new
    @images = FeaturedImage.all
  end

  def create
    @new_image = FeaturedImage.new(params[:featured_image])
    @images = FeaturedImage.all
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
    images = FeaturedImage.all.keep_if{|img| img.position > @image.position}
    respond_to do |format|
      if @image.destroy
        images.each {|image| image.decrement!(:position)}
        format.html{redirect_to featured_images_path, notice: 'Removed image!'}
      else
        format.html{redirect_to featured_images_path, alert: 'Unable to remove image.'}
      end
    end
  end

  def update_position
    params[:featured_image].each do |id, index|
      image = FeaturedImage.find(id)
      image.update_attribute(:position, index)
    end
    respond_to do |format| 
      format.html{redirect_to featured_images_path, notice: 'Updated position!'}
    end
  end
end
