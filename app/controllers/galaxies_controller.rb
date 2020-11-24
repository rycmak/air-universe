class GalaxiesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @owner= User.find(params[:user_id])
    @galaxy = Galaxy.new
  end

  def edit
  end
end
