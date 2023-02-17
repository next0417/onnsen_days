class Admin::OnsensController < ApplicationController
  def new
    @onsen = Onsen.new
  end

  def create
    @onsen = Onsen.new(onsen_params)
    @onsen.save
    redirect_to admin_onsen_path(@onsen.id)
  end

  def index
    @onsens = Onsen.page(params[:page])
  end

  def show
    @onsen = Onsen.find(params[:id])
  end

  def edit
     @onsen = Onsen.find(params[:id])
  end

  def update
    onsen = Onsen.new(onsen_params)
    render :edit and return if onsen.invalid?
    @onsen = Onsen.find(params[:id])
    if params[:onsen][:image_ids]
      params[:onsen][:image_ids].each do |image_id|
        image = @onsen.images.find(image_id)
        image.purge
      end
    end

    if @onsen.update(onsen_params)
      redirect_to admin_onsen_path(@onsen.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def onsen_params
    params.require(:onsen).permit(:name, :introduction, :is_active, :address, :latitude, :longitude, images: [], senshitu_ids: [], kounou_ids: [])
  end
end
