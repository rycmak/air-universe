class BookingsController < ApplicationController

  
  def new
    @galaxy = Galaxy.find(params[:galaxy_id])
    @booking = Booking.new
    # TODO: implement flatpicker date - refer LeWagon setup for 'flatpicker' gem: https://kitt.lewagon.com/knowledge/tutorials/flatpickr
  end

  def create
    @booking = Booking.new(booking_params)
    @galaxy = Galaxy.find(params[:galaxy_id])
    # @booking.total_price = @galaxy.rate * (@booking.end_date - @booking.start_date) / (60 * 60 * 24)
    @booking.total_price = 177
    raise
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
      # redirect to dashboard
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    # TODO: WIP - trying to implement protection - so only customer can delete.
    # if @booking[current_user] == @booking[:customer_id])
      @booking.destroy
      redirect_to user_path(@booking[:customer_id])
    # else
      # put 'error'
    # end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
  def booking_confirmation_params
    params.require(:booking).permit(:status)
  end

end
