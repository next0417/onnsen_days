class Admin::OnsensController < ApplicationController
  def new
    @onsen = Onsen.new
  end

  def create
    @onsen = Onsen.new(onsen_params)
    if @onsen.save
      redirect_to admin_onsen_path(@onsen.id)
    else
      @onsen.validate_images_length_new(params[:onsen][:image_ids]&.length)
      render :new
    end
  end

  def index
    @onsens = Onsen.page(params[:page]).per(9)
  end

  def show
    @onsen = Onsen.find(params[:id])
  end

  def edit
     @onsen = Onsen.find(params[:id])
  end

  def update
    @onsen = Onsen.find(params[:id])
    @onsen.assign_attributes(onsen_params)
    render :edit and return unless @onsen.validate_images_length(params[:onsen][:image_ids]&.length)
    if @onsen.save!
      if params[:onsen][:image_ids]
        params[:onsen][:image_ids].each do |image_id|
          @onsen.images.find do |image|
            if image.id == image_id.to_i
              image.purge
            end
          end
        end
      end
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
