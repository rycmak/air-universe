class BookingsController < ApplicationController

  
  def new
    @galaxy = Galaxy.find(params[:galaxy_id])
    @booking = Booking.new
    # TODO: implement flatpicker date - refer LeWagon setup for 'flatpicker' gem: https://kitt.lewagon.com/knowledge/tutorials/flatpickr
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

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(status: booking_confirmation_params[:status].to_i)
      redirect_to galaxies_path
      # TODO: redirect to dashboard
    else
      render 'edit'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
  def booking_confirmation_params
    params.require(:booking).permit(:status)
  end

end
