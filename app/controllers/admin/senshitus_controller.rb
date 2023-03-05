class Admin::SenshitusController < ApplicationController
  def create
    @senshitu = Senshitu.new(senshitu_params)
    if @senshitu.save
      redirect_to admin_genre_tags_path
    else
      @kounou = Kounou.new
      @senshitus = Senshitu.page(params[:senshitu_page]).per(6)
      @kounous = Kounou.page(params[:kounou_page]).per(6)
      render 'admin/genre_tags/index'
    end
  end

  def destroy
    @senshitu = Senshitu.find(params[:id])
    @senshitu.destroy
    redirect_to admin_genre_tags_path
  end

  private
  def senshitu_params
    params.require(:senshitu).permit(:senshitu_name)
  end
end
