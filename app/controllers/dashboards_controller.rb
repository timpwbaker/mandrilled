class DashboardsController < ApplicationController
  def show
    render locals: { data_miner: data_miner }
  end

  def create
    render :show, locals: { data_miner: data_miner }
  end

  private

  def dashboard_params
    params.permit(:start_date, :end_date)
  end

  def start_date
    dashboard_params.fetch(:start_date, DateTime.current - 7.days)
  end

  def end_date
    dashboard_params.fetch(:end_date, DateTime.current)
  end

  def data_miner
    @_data_miner ||= DataMiner.new(
      start_date: start_date,
      end_date: end_date
    )
  end
end
