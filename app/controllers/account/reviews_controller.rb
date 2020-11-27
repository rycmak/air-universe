class Account::ReviewsController < ApplicationController

  def index
    @my_reviews = current_user.reviews
  end

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end


end
