class DataRequest < ActiveResource::Base
  self.site = ENV.fetch("DUMMY_EVENTS_URL")
end
