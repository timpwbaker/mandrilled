class DataRequestsController < ApplicationController

  def create
    DataRequest.new.save
  end
end
