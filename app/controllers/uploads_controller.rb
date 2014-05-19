class UploadsController < ApplicationController
  before_filter :authenticate
  def new
    @upload = Upload.new
  end

  def create
    @upload = current_user.uploads.build(params[:upload])

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

    respond_to do |format|
      if @upload.update_attributes(key: params[:key])
        format.html{redirect_to root_path, notice: "Thank you for uploading! Your contribution is greatly appreciated!"}
      else
        @file = @upload.game
        @file.success_action_redirect = upload_update_url(@upload)
        format.html{render :edit}
      end
    end
  end
end
