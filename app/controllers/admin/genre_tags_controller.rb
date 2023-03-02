class Admin::GenreTagsController < ApplicationController
  def index
    @senshitu = Senshitu.new
    @kounou = Kounou.new
    @senshitus = Senshitu.page(params[:senshitu_page]).per(6)
    @kounous = Kounou.page(params[:kounou_page]).per(6)
  end
end
