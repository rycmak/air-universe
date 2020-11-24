class GalaxiesController < ApplicationController

  def index
    @galaxies = Galaxy.all
  end

  def show
  end

  def edit
  end
end
