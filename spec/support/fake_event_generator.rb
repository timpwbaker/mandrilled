require "sinatra"

module FakeEventGenerator
  class Application < Sinatra::Base
    require "json"

    cattr_accessor :base_url

    post "/data_requests" do
      json_response 200, fake_event
    end

    def fake_event
      "{\"Address\":\"callum@foobar.baz\",\"EmailType\":\"Shipment\",\"Event\":\"open\",\"Timestamp\":#{timestamp}}"
    end

    def timestamp
      now = Time.now
      (now - Random.rand(100000)).to_i
    end
  end
end
