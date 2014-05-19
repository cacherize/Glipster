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
    @upload = Upload.find(params[:id])
    @file = @upload.game
    @file.success_action_redirect = upload_update_url(@upload)
  end

  def update
    @upload = Upload.find(params[:id])
    @upload.update_attributes(key: params[:key])

    respond_to do |format|
      format.html{redirect_to root_path, notice: "Thank you for uploading! Your contribution is greatly appreciated!"}
    end
  end
end
