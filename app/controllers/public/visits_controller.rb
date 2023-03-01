class Public::VisitsController < ApplicationController
  def create
    @onsen = Onsen.find(params[:onsen_id])
    @visit = current_user.visits.new(onsen_id: @onsen.id)
    @visit.save
    redirect_back(fallback_location: root_path)
  end

  def index
    @user = current_user
    case params[:sort].to_i
    when 0 then
      @visits = @user.visits.alphabet.page(params[:page])
    when 1 then
      @sort = @user.visits.rate_desc
      @visits = Kaminari.paginate_array(@sort).page(params[:page])
    when 2 then
      @sort = @user.visits.rate_asc
      @visits = Kaminari.paginate_array(@sort).page(params[:page])
    else
      @visits = @user.visits.all.page(params[:page])
    end

  end

  def destroy
    @onsen = Onsen.find(params[:onsen_id])
    @visit = current_user.visits.find_by(onsen_id: @onsen.id)
    @visit.destroy
    redirect_back(fallback_location: root_path)
  end
end
