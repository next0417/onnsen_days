class Public::OnsensController < ApplicationController
  def index
    @onsens = Onsen.page(params[:page])
  end
end
