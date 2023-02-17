class Admin::KounousController < ApplicationController
  def create
    @kounou = Kounou.new(kounou_params)
    @kounou.save
    redirect_to admin_genre_tags_path
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
