require "rails_helper"

RSpec.feature "User visits the dashboard" do
  scenario "no emals have been sent yet" do
    visit root_path

    expect(page).to have_content "Emails sent: 0"
    expect(page).to have_content "Emails opened: 0"
    expect(page).to have_content "Total clicks: 0"
    expect(page).to have_content "No emails have been sent. Send some in order "\
      "to see conversion rates."
  end

  scenario "from the root path" do
    FactoryGirl.create_list :event, 10, :now, :send, :shipment
    FactoryGirl.create_list :event, 5, :now, :open, :shipment
    FactoryGirl.create_list :event, 1, :now, :click, :shipment

    visit root_path

    expect(page).to have_content "Emails sent: 10"
    expect(page).to have_content "Emails opened: 5"
    expect(page).to have_content "Total clicks: 1"
  end
end

RSpec.feature "User can see open and click charts", js: true do
  scenario "from the root path" do
    FactoryGirl.create_list :event, 10, :now, :send, :shipment
    FactoryGirl.create_list :event, 5, :now, :open, :shipment
    FactoryGirl.create_list :event, 1, :now, :click, :shipment

    visit root_path

    expect(page).to have_content "Total clicks: 1"
    expect(page).to have_content "Open rate"
    expect(page).to have_content "Click rate"
  end
end

RSpec.feature "User can choose the dates they want to query", js: true do
  scenario "and have the data adjust accordingly" do
    FactoryGirl.create_list :event, 10, :send, :shipment, :now
    FactoryGirl.create_list :event, 15, :send, :shipment, :yesterday
    FactoryGirl.create_list :event, 5, :open, :shipment, :now
    FactoryGirl.create_list :event, 9, :open, :shipment, :yesterday
    FactoryGirl.create_list :event, 5, :click, :shipment, :now
    FactoryGirl.create_list :event, 1, :click, :shipment, :yesterday

    visit root_path

    expect(page).to have_content "Emails sent: 25"
    expect(page).to have_content "Emails opened: 14"
    expect(page).to have_content "Total clicks: 6"

    select Date.today.day, from: "start_date_day"
    select Date.today.strftime("%B"), from: "start_date_month"
    select Date.today.year, from: "start_date_year"
    click_button "Search"

    expect(page).to have_content "Emails sent: 10"
    expect(page).to have_content "Emails opened: 5"
    expect(page).to have_content "Total clicks: 5"
  end
end
