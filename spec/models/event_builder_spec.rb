require "rails_helper"

RSpec.describe EventBuilder, ".build" do
  it "takes params and returns an event" do
    new_event = EventBuilder.build(event_params: event_params)

    expect(new_event.class.name).to eq "Event"
  end
end

def event_params
  {
    "address"=>"barney@lostmy.name",
    "email_type"=>"Shipment",
    "event"=>"send",
    "timestamp"=>1432820696
  }
end
