class Public::HomesController < ApplicationController
  def top
    @onsen = Onsen.new
    if params[:onsen].present? &&
      (params[:onsen][:keyword].present? ||
        params[:onsen][:senshitu_ids].present? ||
        params[:onsen][:kounou_ids].present? ||
        params[:onsen][:sort].present?)
      @onsens = Onsen.search(
        params[:onsen][:keyword],
        params[:onsen][:senshitu_ids],
        params[:onsen][:kounou_ids],
        params[:onsen][:sort]
      ).page(params[:page]).per(6)
    else
      @onsens = Onsen.all.page(params[:page]).per(6)
    end
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com', name: 'guest') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to root_path
  end
end
