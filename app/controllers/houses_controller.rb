class HousesController < ApplicationController
  before_action :set_house, only: %i[show edit update destroy]

  # GET /houses or /houses.json
  def index
    @houses = House.all
    render json: @houses
  end

  # GET /houses/1 or /houses/1.json
  def show
    render json: @house
  end

  # GET /houses/new
  def new
    @house = House.new
  end

  # POST /houses
  def create
    @house = House.new(house_params)

    if @house.save
      render json: @house, status: :created
    else
      render json: @house.errors, status: :unprocessable_entity
    end
  end

  # DELETE /houses/1
  def destroy
    @house.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_house
    @house = House.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def house_params
    params.require(:house).permit(:name, :address, :description, :city, :photo, :night_price)
  end
end
