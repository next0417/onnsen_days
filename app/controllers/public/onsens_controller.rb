class Public::OnsensController < ApplicationController
  def index
    case params[:sort].to_i
    when 0 then
      @onsens = Onsen.alphabet.page(params[:page]).per(9)
    when 1 then
      @onsens = Onsen.rate_desc.page(params[:page]).per(9)
    when 2 then
      @onsens = Onsen.rate_asc.page(params[:page]).per(9)
    else
      @onsens = Onsen.all.page(params[:page]).per(9)
    end
  end

  def show
    @onsen = Onsen.find(params[:id])
  end
end
