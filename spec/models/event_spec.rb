require 'rails_helper'

RSpec.describe Event, "associations" do
  it { should validate_presence_of :address }
  it { should validate_presence_of :email_type }
  it { should validate_presence_of :event }
  it { should validate_presence_of :timestamp }
end
