class Api::V1::SystemUsageController < ApplicationController
  def index
    @usage = SystemUsage.order(:created_at).last(60)

    render json: @usage
  end

  def hourly
    @usage = SystemUsage.where(minute_created: 0).order(:created_at).last(24)

    render json: @usage
  end
end