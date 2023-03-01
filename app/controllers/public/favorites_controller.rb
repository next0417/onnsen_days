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
      @favorites = @user.favorites.alphabet.page(params[:page])
    when 1 then
      @sort = @user.favorites.rate_desc
      @favorites = Kaminari.paginate_array(@sort).page(params[:page])
    when 2 then
      @sort = @user.favorites.rate_asc
      @favorites = Kaminari.paginate_array(@sort).page(params[:page])
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
