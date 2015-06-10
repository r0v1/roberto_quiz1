class SupportsController < ApplicationController

  def welcome
    @supports = Support.all
  end

  def index
    if params[:q]
      @supports = Support.search(params[:q]).page(params[:page]).per(10).order("status")
    else
      @supports = Support.page(params[:page]).per(10).order("status")
    end
  end

  def show
   @support = Support.find(params[:id])
   # render text: @support.description
  end

  def new
    @support = Support.new
  end

  def create
    support_params = params.require(:support).permit([:name, :email, :department, :message])
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

  def status
    @support = Support.find params[:id]
    if @support.status
      @support.update(status: true)
    else
      @support.update(status: false)
    end

    redirect_to supports_path
  end

  private

  def support_params
    params.require(:support).permit([:name, :email, :department, :message, :status])
  end



end
