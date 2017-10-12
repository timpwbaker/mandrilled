require "rails_helper"

RSpec.describe "Create events API endpoint" do
  context "Valid request" do
    it "creates an event" do
      payload = {"Address":"barney@lostmy.name",
                 "EmailType":"Shipment",
                 "Event":"send",
                 "Timestamp":1432820696}
      headers = {"Content-Type" => "text/json" }

      post '/events', params: payload.to_json, headers: headers

      expect(response).to have_http_status(200)
    end
  end

  context "Invalid request" do
    it "does not create an event if Address is missing" do
      payload = {"EmailType":"Shipment",
                 "Event":"send",
                 "Timestamp":1432820696}
      headers = {"Content-Type" => "text/json" }

      post '/events', params: payload.to_json, headers: headers

      expect(response).to have_http_status(422)
    end

    it "does not create an event if EmailType is missing" do
      payload = {"Address":"barney@lostmy.name",
                 "Event":"send",
                 "Timestamp":1432820696}
      headers = {"Content-Type" => "text/json" }

      post '/events', params: payload.to_json, headers: headers

      expect(response).to have_http_status(422)
    end

    it "does not create an event if Address is missing" do
      payload = {"Address":"barney@lostmy.name",
                 "EmailType":"Shipment",
                 "Timestamp":1432820696}
      headers = {"Content-Type" => "text/json" }

      post '/events', params: payload.to_json, headers: headers

      expect(response).to have_http_status(422)
    end

    it "does not create an event if Timestamp is missing" do
      payload = {"Address":"barney@lostmy.name",
                 "EmailType":"Shipment",
                 "Event":"send"}
      headers = {"Content-Type" => "text/json" }

      post '/events', params: payload.to_json, headers: headers

      expect(response).to have_http_status(422)
    end
  end
end

