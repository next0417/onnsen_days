class Admin::ReviewsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @reviews = @user.reviews.page(params[:page]).per(10)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_user_reviews_path
  end
end
