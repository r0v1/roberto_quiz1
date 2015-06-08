class SupportsController < ApplicationController

  def welcome
    @current_time = DateTime.now
    @authors_names = ["Brent", "John", "Vatne"]
    @supports = Support.all
  end

  def index
    @current_time = DateTime.now
    @authors_names = ["Brent", "John", "Vatne"]
    @supports = Support.all
  end

  def show
   @support = Support.find(params[:id])
   # render text: @support.description
  end

  def new
    @support = Support.new
  end

  def create
    support_params = params.require(:support).permit([:name, :email, :department, :message, :status])
    @support       = Support.new(support_params)
    if @support.save
      redirect_to support_path(@support.id)
    else
      render :new
    end

  end

  def edit
    @support = Support.find(params[:id])
    # render text: @tweet.message
  end

  def update
    @support = Support.find(params[:id])
    @support.update(support_params)
    redirect_to support_path(@support.id)
  end

  def destroy
    @support = Support.find(params[:id])
    @support.destroy
    redirect_to supports_path
  end


  private

  def support_params
    params.require(:support).permit([:name, :email, :department, :message, :status])
  end



end
