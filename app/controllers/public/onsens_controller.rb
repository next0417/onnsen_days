class Public::OnsensController < ApplicationController
  def index
    case params[:sort].to_i
    when 0 then
      @onsens = Onsen.alphabet.page(params[:page])
    when 1 then
      @onsens = Onsen.rate_desc.page(params[:page])
    when 2 then
      @onsens = Onsen.rate_asc.page(params[:page])
    else
      @onsens = Onsen.all.page(params[:page])
    end
  end

  def show
    @onsen = Onsen.find(params[:id])
  end
end
