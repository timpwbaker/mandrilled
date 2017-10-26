class Event < ApplicationRecord
  validates :address, presence: true
  validates :email_type, presence: true
  validates :event, presence: true
  validates :timestamp, presence: true

  after_create :notify_real_time_feed

  def self.order_by_timestamp
    order("timestamp ASC")
  end

  def notify_real_time_feed
    ActionCable.server.broadcast(
      "real_time_events_channel", 
      event: event,
      email_type: email_type,
      timestamp: timestamp_string
    )
  end

  def timestamp_string
    timestamp.strftime("%d %b %Y - %H:%M:%S")
  end
end
