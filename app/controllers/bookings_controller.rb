class BookingsController < ApplicationController

  def new
    @galaxy = Galaxy.find(params[:galaxy_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @galaxy = Galaxy.find(params[:galaxy_id])
    # @booking.total_price = @galaxy.rate
    @booking.customer = current_user
    @booking.galaxy = @galaxy
    if @booking.save!
      redirect_to galaxy_path(@galaxy)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
    
  end

end
