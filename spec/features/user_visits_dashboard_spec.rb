require "rails_helper"

RSpec.feature "User visits the dashboard" do
  scenario "from the root path" do
    FactoryGirl.create_list :event, 10, :send, :shipment
    FactoryGirl.create_list :event, 5, :open, :shipment
    FactoryGirl.create_list :event, 1, :click, :shipment

    visit root_path

    expect(page).to have_content "Emails sent: 10"
    expect(page).to have_content "Emails opened: 5"
    expect(page).to have_content "Total clicks: 1"
  end
end

RSpec.feature "User can see open and click charts", js: true do
  scenario "from the root path" do
    FactoryGirl.create_list :event, 10, :send, :shipment
    FactoryGirl.create_list :event, 5, :open, :shipment
    FactoryGirl.create_list :event, 1, :click, :shipment

    visit root_path

    expect(page).to have_content "Total clicks: 1"
    expect(page).to have_content "Open rate"
    expect(page).to have_content "Click rate"
  end
end
