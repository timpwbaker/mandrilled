class DashboardsController < ApplicationController
  def index
    render locals: { dashboard_data_presenter: dashboard_data_presenter }
  end

  private

  def dashboard_params
    params.permit(:start_date, :end_date)
  end

  def start_date
    dashboard_params.fetch(:start_date, nil)
  end

  def end_date
    dashboard_params.fetch(:end_date, nil)
  end

  def dashboard_data_presenter
    @_dashboard_data_presenter ||= DashboardDataPresenter.new(
      start_date: start_date,
      end_date: end_date
    )
  end
end
