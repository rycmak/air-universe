class Account::GalaxiesController < ApplicationController
  
  def index
    @my_galaxies = current_user.galaxies
  end

end
