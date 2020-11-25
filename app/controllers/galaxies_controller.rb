class GalaxiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @galaxies = Galaxy.all
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

  def show
    @galaxy = Galaxy.find(params[:id])
  end

  def edit
    @galaxy = Galaxy.find(params[:id])
  end

  def update
    @galaxy = Galaxy.find(params[:id])
    @galaxy.update(galaxy_params)

    redirect_to galaxy_path(@galaxy)
  end

  def destroy
    @galaxy = Galaxy.find(params[:id])
    @galaxy.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to galaxies_path
  end

  private

  def galaxy_params
    params.require(:galaxy).permit(:name, :description, :rate)
  end
end
