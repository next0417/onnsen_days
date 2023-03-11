class Admin::KounousController < ApplicationController
  def create
    @kounou = Kounou.new(kounou_params)
    if @kounou.save
      redirect_to admin_genre_tags_path
    else
      @senshitu = Senshitu.new
      @senshitus = Senshitu.page(params[:senshitu_page]).per(6)
      @kounous = Kounou.page(params[:kounou_page]).per(6)
      render 'admin/genre_tags/index'
    end
  end

  def destroy
    @kounou = Kounou.find(params[:id])
    @kounou.destroy
    redirect_to admin_genre_tags_path
  end

  private
  def kounou_params
    params.require(:kounou).permit(:kounou_name)
  end
end
