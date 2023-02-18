class Public::OnsensController < ApplicationController
  def index
    @onsens = Onsen.page(params[:page])
  end

  def show
    @onsen = Onsen.find(params[:id])
  end
end
