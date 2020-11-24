class GalaxiesController < ApplicationController
  def index
  end

  def show
    @galaxy = Galaxy.find(params[:id])
  end

  def edit
  end
end
