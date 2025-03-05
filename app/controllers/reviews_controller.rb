class ReviewsController < ApplicationController
  before_action :set_restaurant
  before_action :set_review, only: [:edit, :update, :destroy]

  def new
    @review = Review.new
  end

  def create
    @review = @restaurant.reviews.build(review_params)
    if @review.save
      respond_to do |format|
        # Turbo Stream Response: Dynamically add the review without reloading
        format.turbo_stream { render turbo_stream: turbo_stream.append('reviews', partial: 'reviews/review', locals: { review: @review }) }

        # HTML Response: Redirect to the restaurant's show page
        format.html { redirect_to @restaurant, notice: 'Review was successfully created.' }
      end
    else
      render :new
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      # Turbo Stream Response: Remove the review from the page without reloading
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@review) }

      # HTML Response: Redirect back to the restaurant's show page
      format.html { redirect_to @restaurant, notice: 'Review was successfully deleted.' }
    end
  end

  def edit
    # This action is to render the form for editing the review
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.find(params[:id])
  end

  def update
    if @review.update(review_params)
      redirect_to @restaurant, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_review
    @review = @restaurant.reviews.find(params[:id])
  end
end
