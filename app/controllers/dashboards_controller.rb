class DashboardsController < ApplicationController
  def show
    render locals: { data_miner: data_miner }
  end

  def create
    render :show, locals: { data_miner: data_miner }
  end

  private

  def dashboard_params
    params.permit(start_date: [:year, :month, :day], 
                  end_date: [:year, :month, :day])
  end

  def start_date_params
    dashboard_params.fetch(:start_date, nil)
  end

  def end_date_params
    dashboard_params.fetch(:end_date, nil)
  end

  def start_date
    if start_date_params
      Date.new(
        start_date_params[:year].to_i, 
        start_date_params[:month].to_i, 
        start_date_params[:day].to_i
      ).beginning_of_day
    else
      (Date.today - 7.days).beginning_of_day
    end
  end

  def end_date
    if end_date_params
      Date.new(
        end_date_params[:year].to_i, 
        end_date_params[:month].to_i, 
        end_date_params[:day].to_i
      ).end_of_day
    else
      Date.today.end_of_day
    end
  end

  def data_miner
    @_data_miner ||= DataMiner.new(
      start_date: start_date,
      end_date: end_date
    )
  end
end
