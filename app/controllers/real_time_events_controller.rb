class RealTimeEventsController < ApplicationController
  def show
    render locals: { data_miner: data_miner }
  end

  def data_miner
    @_data_miner ||= DataMiner.new(
      start_date: Date.today,
      end_date: Date.today
    )
  end
end
