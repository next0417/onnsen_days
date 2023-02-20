class Public::ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @onsen = Onsen.find(params[:onsen_id])
    @review = Review.new(review_params)
    @review.onsen = @onsen
    @review.user = current_user
    @review.save
    redirect_to onsen_reviews_path(@onsen.id)
  end

  def index
    @onsen = Onsen.find(params[:onsen_id])
    @reviews = @onsen.reviews.page(params[:page])
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to onsen_reviews_path
  end

  private
  def review_params
    params.require(:review).permit(:title, :body, :rate)
  end
end
