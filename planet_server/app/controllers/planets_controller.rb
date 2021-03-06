class PlanetsController < ApplicationController
  def index
    planets = Planet.all
    render json: {planets: planets}
  end

  def show
    planet = Planet.find(params["id"])
    render json: {planet: planet}
  end

  def create
    planet = Planet.create! planet_params
    render json: {planet: planet}
  end

  def update
    planet = Planet.find(params["id"])
    planet.update! planet_params
    render json: {planet: planet}
  end

  def destroy
    planet = Planet.find(params["id"])
    planet.destroy!
    render json: {planet: planet}
  end

  private

  def planet_params
    params.require(:planet).permit(:name, :num_moons, :color)
  end

end
