class Public::VisitsController < ApplicationController
  def create
    @onsen = Onsen.find(params[:onsen_id])
    @visit = current_user.visits.new(onsen_id: @onsen.id)
    @visit.save
    redirect_back(fallback_location: root_path)
  end

  def index
    @user = current_user
    @visits = @user.visits.page(params[:page])
  end

  def destroy
    @onsen = Onsen.find(params[:onsen_id])
    @visit = current_user.visits.find_by(onsen_id: @onsen.id)
    @visit.destroy
    redirect_back(fallback_location: root_path)
  end
end
