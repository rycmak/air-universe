class Account::OffersController < ApplicationController

  def index
    @my_galaxies = current_user.galaxies


    # @my_offers = []
    # @my_galaxies.each do |galaxy|
    #   if galaxy.bookings != nil
    #     @my_offers << galaxy.bookings 
    #   end
    # return @my_offers!
    # end
  end

end
