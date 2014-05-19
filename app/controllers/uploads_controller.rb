class UploadsController < ApplicationController
  def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(params[:upload])

    respond_to do |format|
      if @upload.save
        format.html{redirect_to select_file_path(@upload)}
      else
        format.html{render :new}
      end
    end
  end

  def edit
  end

  def update
  end
end
