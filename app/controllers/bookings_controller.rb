class BookingsController < ApplicationController

  def new
    @galaxy2 = Galaxy.find(params[:galaxy_id])
    @booking = Booking.new
  end

  def create
    @galaxy = Galaxy.find(params[:galaxy_id])
  end

end
