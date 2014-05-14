class FaqsController < ApplicationController
  before_filter :authorize, only: [:new, :create, :update, :destroy]
  respond_to :html, :json
  def index
    @faqs = Faq.all
    @grouped_faqs = @faqs.in_groups(3, false)
  end

  def new
    @new_faq = Faq.new
  end

  def create
    @new_faq = Faq.new(params[:faq])

    respond_to do |format|
      if @new_faq.save
        format.html{redirect_to faq_path, notice: "Successfully added new FAQ!"}
      else
        format.html{render :new}
      end
    end
  end

  def update
    @faq = Faq.find(params[:id])

    @faq.update_attributes(params[:faq])
    respond_with @faq
  end

  def destroy
  end
end
