class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking

    if @review.save
      redirect_to  galaxy_path(@booking.galaxy)
    else
      render 'new'
    end

  end

  private 
  
  def review_params
    params.require(:review).permit(:description, :rating)
  end

end
