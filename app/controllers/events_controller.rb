class EventsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def create
    event = EventBuilder.build(event_params: event_params)
    if event.save
      head :ok
    else
      head :unprocessable_entity
    end
  end

  private

  def event_params
    params.permit("Address", "EmailType", "Event", "Timestamp")
  end

  def params
    ActionController::Parameters.new(JSON.parse(request.raw_post))
  end
end
