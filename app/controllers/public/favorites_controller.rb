class Public::FavoritesController < ApplicationController
  def create
    @onsen = Onsen.find(params[:onsen_id])
    @favorite = current_user.favorites.new(onsen_id: @onsen.id)
    @favorite.save
    redirect_back(fallback_location: root_path)
  end

  def index
    @user = current_user
    case params[:sort].to_i
    when 0 then
      pp "------------------------0------------------------------"
      @favorites = @user.favorites.alphabet.page(params[:page])
    when 1 then
      pp "------------------------1------------------------------"
      @favorites = @user.favorites.rate_desc.page(params[:page])
    when 2 then
      pp "------------------------2------------------------------"
      @favorites = @user.favorites.rate_asc.page(params[:page])
    else
      @favorites = @user.favorites.all.page(params[:page])
    end
  end

  def destroy
    @onsen = Onsen.find(params[:onsen_id])
    @favorite = current_user.favorites.find_by(onsen_id: @onsen.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
