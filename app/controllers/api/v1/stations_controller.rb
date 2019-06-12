class Api::V1::StationsController < ApplicationController
  def index
    @stations = Station.order(:name)

    render json: @stations
  end
end