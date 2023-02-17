class Admin::SenshitusController < ApplicationController
  def create
    @senshitu = Senshitu.new(senshitu_params)
    @senshitu.save
    redirect_to admin_genre_tags_path
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
