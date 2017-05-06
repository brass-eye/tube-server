class StationsController < ApplicationController
  before_action :set_station, only: [:show, :update, :destroy]

  # GET /stations
  def index
    @stations = Station.all

    render json: @stations
  end

  # GET /stations/1
  def show
    render json: @station
  end

  # GET /visited
  def visited
    @stations = Station.joins(:visits).distinct
    render json: @stations

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station
      @station = Station.find_by code: params[:id].upcase
    end

    # Only allow a trusted parameter "white list" through.
    def station_params
      params.require(:station).permit(:name, :code)
    end
end
