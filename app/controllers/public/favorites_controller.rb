class Public::FavoritesController < ApplicationController
  def create
    @onsen = Onsen.find(params[:onsen_id])
    @favorite = current_user.favorites.new(onsen_id: @onsen.id)
    @favorite.save
    redirect_back(fallback_location: root_path)
  end

  def index
    @user = current_user
    @favorites = @user.favorites.page(params[:page])
  end

  def destroy
    @onsen = Onsen.find(params[:onsen_id])
    @favorite = current_user.favorites.find_by(onsen_id: @onsen.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
