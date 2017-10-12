class EventBuilder
  attr_reader :event_params

  def self.build(event_params:)
    new(event_params: event_params).build
  end

  def initialize(event_params:)
    @event_params = event_params
  end

  def build
    Event.new(event_attributes)
  end

  private

  def event_attributes
    {
      address: event_params["Address"],
      email_type: event_params["EmailType"],
      event: event_params["Event"],
      timestamp: unix_to_timestamp
    }
  end

  def unix_to_timestamp
    begin
      DateTime.strptime(event_params["Timestamp"].to_s,'%s')
    rescue
      nil
    end
  end
end
