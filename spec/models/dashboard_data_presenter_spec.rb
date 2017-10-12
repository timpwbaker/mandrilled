require "rails_helper"

RSpec.describe DashboardDataPresenter, ".initialize" do
  it "takes a start date and an end date as an argument" do
    start_date = Date.today - 7.days
    end_date = Date.today
    dashboard_data_presenter = DashboardDataPresenter.new(start_date: start_date,
                                                          end_date: end_date)

    expect(dashboard_data_presenter.start_date).to eq Date.today - 7.days
    expect(dashboard_data_presenter.end_date).to eq Date.today
  end
end

RSpec.describe DashboardDataPresenter, "#sent" do
  it "returns a count of all sent emails if no type is given" do
    FactoryGirl.create_list :event, 10, :send, :user_confirmation
    FactoryGirl.create_list :event, 10, :send, :shipment
    start_date = DateTime.current - 7.days
    end_date = DateTime.current
    dashboard_data_presenter = DashboardDataPresenter.new(start_date: start_date,
                                                          end_date: end_date)

    expect(dashboard_data_presenter.sent).to eq 20
  end

  it "returns a count of all sent emails of a certain type if specified" do
    FactoryGirl.create_list :event, 10, :send, :user_confirmation
    FactoryGirl.create_list :event, 10, :send, :shipment
    start_date = DateTime.current - 7.days
    end_date = DateTime.current
    dashboard_data_presenter = DashboardDataPresenter.new(start_date: start_date,
                                                          end_date: end_date)

    expect(dashboard_data_presenter.sent(type: "Shipment")).to eq 10
  end
end

RSpec.describe DashboardDataPresenter, "#opened" do
  it "returns a count of all opened emails if no type is given" do
    FactoryGirl.create_list :event, 10, :open, :user_confirmation
    FactoryGirl.create_list :event, 10, :open, :shipment
    start_date = DateTime.current - 7.days
    end_date = DateTime.current
    dashboard_data_preopeneder = DashboardDataPresenter.new(start_date: start_date,
                                                          end_date: end_date)

    expect(dashboard_data_preopeneder.opened).to eq 20
  end

  it "returns a count of all opened emails of a certain type if specified" do
    FactoryGirl.create_list :event, 10, :open, :user_confirmation
    FactoryGirl.create_list :event, 10, :open, :shipment
    start_date = DateTime.current - 7.days
    end_date = DateTime.current
    dashboard_data_preopeneder = DashboardDataPresenter.new(start_date: start_date,
                                                          end_date: end_date)

    expect(dashboard_data_preopeneder.opened(type: "Shipment")).to eq 10
  end
end

RSpec.describe DashboardDataPresenter, "#opened" do
  it "returns a count of all opened emails if no type is given" do
    FactoryGirl.create_list :event, 10, :open, :user_confirmation
    FactoryGirl.create_list :event, 10, :open, :shipment
    start_date = DateTime.current - 7.days
    end_date = DateTime.current
    dashboard_data_presenter = DashboardDataPresenter.new(start_date: start_date,
                                                          end_date: end_date)

    expect(dashboard_data_presenter.opened).to eq 20
  end

  it "returns a count of all opened emails of a certain type if specified" do
    FactoryGirl.create_list :event, 10, :open, :user_confirmation
    FactoryGirl.create_list :event, 10, :open, :shipment
    start_date = DateTime.current - 7.days
    end_date = DateTime.current
    dashboard_data_presenter = DashboardDataPresenter.new(start_date: start_date,
                                                          end_date: end_date)

    expect(dashboard_data_presenter.opened(type: "Shipment")).to eq 10
  end
end

RSpec.describe DashboardDataPresenter, "#clicked" do
  it "returns a count of all clicked emails if no type is given" do
    FactoryGirl.create_list :event, 10, :click, :user_confirmation
    FactoryGirl.create_list :event, 10, :click, :shipment
    start_date = DateTime.current - 7.days
    end_date = DateTime.current
    dashboard_data_presenter = DashboardDataPresenter.new(start_date: start_date,
                                                          end_date: end_date)

    expect(dashboard_data_presenter.clicked).to eq 20
  end

  it "returns a count of all clicked emails of a certain type if specified" do
    FactoryGirl.create_list :event, 10, :click, :user_confirmation
    FactoryGirl.create_list :event, 10, :click, :shipment
    start_date = DateTime.current - 7.days
    end_date = DateTime.current
    dashboard_data_presenter = DashboardDataPresenter.new(start_date: start_date,
                                                          end_date: end_date)

    expect(dashboard_data_presenter.clicked(type: "Shipment")).to eq 10
  end
end

RSpec.describe DashboardDataPresenter, "#open_rate" do
  it "returns the open rate for all emails if no type is given" do
    FactoryGirl.create_list :event, 10, :send, :shipment
    FactoryGirl.create_list :event, 9, :send, :user_confirmation
    FactoryGirl.create_list :event, 5, :open, :shipment
    FactoryGirl.create_list :event, 2, :open, :user_confirmation

    start_date = DateTime.current - 7.days
    end_date = DateTime.current
    dashboard_data_presenter = DashboardDataPresenter.new(start_date: start_date,
                                                          end_date: end_date)

    expect(dashboard_data_presenter.open_rate).to eq 36.84
  end

  it "returns the open rate for a certain type if specified" do
    FactoryGirl.create_list :event, 10, :send, :shipment
    FactoryGirl.create_list :event, 9, :send, :user_confirmation
    FactoryGirl.create_list :event, 5, :open, :shipment
    FactoryGirl.create_list :event, 2, :open, :user_confirmation

    start_date = DateTime.current - 7.days
    end_date = DateTime.current
    dashboard_data_presenter = DashboardDataPresenter.new(start_date: start_date,
                                                          end_date: end_date)

    expect(dashboard_data_presenter.open_rate(type: "Shipment")).to eq 50.0
  end
end

RSpec.describe DashboardDataPresenter, "#click_rate" do
  it "returns the open rate for all emails if no type is given" do
    FactoryGirl.create_list :event, 5, :open, :shipment
    FactoryGirl.create_list :event, 2, :open, :user_confirmation
    FactoryGirl.create_list :event, 1, :click, :shipment
    FactoryGirl.create_list :event, 2, :click, :user_confirmation

    start_date = DateTime.current - 7.days
    end_date = DateTime.current
    dashboard_data_presenter = DashboardDataPresenter.new(start_date: start_date,
                                                          end_date: end_date)

    expect(dashboard_data_presenter.click_rate).to eq 42.86
  end

  it "returns the open rate for a certain type if specified" do
    FactoryGirl.create_list :event, 5, :open, :shipment
    FactoryGirl.create_list :event, 2, :open, :user_confirmation
    FactoryGirl.create_list :event, 1, :click, :shipment
    FactoryGirl.create_list :event, 2, :click, :user_confirmation

    start_date = DateTime.current - 7.days
    end_date = DateTime.current
    dashboard_data_presenter = DashboardDataPresenter.new(start_date: start_date,
                                                          end_date: end_date)

    expect(dashboard_data_presenter.click_rate(type: "Shipment")).to eq 20.0
  end
end
