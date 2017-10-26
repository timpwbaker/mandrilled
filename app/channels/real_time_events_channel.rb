class RealTimeEventsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "real_time_events_channel"
  end

  def unsubscribed

  end
end
