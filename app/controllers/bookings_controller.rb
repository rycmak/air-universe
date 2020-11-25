class BookingsController < ApplicationController

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    # if @booking.update(params[:id])
    #   redirect_to galaxies_path
    # else
    #   render 'edit'
    # end
  end

  # private
  
  # def booking_params
  #   params.require(:booking).permit(:status)
  # end

  
end
