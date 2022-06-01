class ReviewsController < ApplicationController
  before_action :find_restaurant, only: %i[new create]

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    @review.save

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def new
    @review = Review.new
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
