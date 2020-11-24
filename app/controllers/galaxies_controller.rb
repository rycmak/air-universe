class GalaxiesController < ApplicationController

  def index
    @galaxies = Galaxy.all
  end

  def show
    @galaxy = Galaxy.find(params[:id])
  end

  def new
    @owner = User.find(params[:user_id])
    @galaxy = Galaxy.new
  end

  def create
    @galaxy = Galaxy.new(galaxy_params)
    @owner = User.find(params[:user_id])
    @galaxy.owner = @owner
    @galaxy.save

    redirect_to galaxy_path(@galaxy)
  end

  def edit
  end

  private

  def galaxy_params
    params.require(:galaxy).permit(:name, :description, :rate)
    
  end
end
