require "rails_helper"

RSpec.describe DataMiner, ".initialize" do
  it "takes a start date and an end date as an argument" do
    start_date = Date.today - 7.days
    end_date = Date.today
    data_miner = DataMiner.new(start_date: start_date,
                                       end_date: end_date)

    expect(data_miner.start_date).to eq Date.today - 7.days
    expect(data_miner.end_date).to eq Date.today
  end
end

RSpec.describe DataMiner, "#sent" do
  it "returns a count of all sent emails if no type is given" do
    FactoryGirl.create_list :event, 10, :send, :user_confirmation
    FactoryGirl.create_list :event, 10, :send, :shipment
    start_date = DateTime.current - 7.days
    end_date = DateTime.current
    data_miner = DataMiner.new(start_date: start_date,
                                       end_date: end_date)

    expect(data_miner.sent).to eq 20
  end

  it "returns a count of all sent emails of a certain type if specified" do
    FactoryGirl.create_list :event, 10, :send, :user_confirmation
    FactoryGirl.create_list :event, 10, :send, :shipment
    start_date = DateTime.current - 7.days
    end_date = DateTime.current
    data_miner = DataMiner.new(start_date: start_date,
                                       end_date: end_date)

    expect(data_miner.sent(type: "Shipment")).to eq 10
  end
end

RSpec.describe DataMiner, "#opened" do
  it "returns a count of all opened emails if no type is given" do
    FactoryGirl.create_list :event, 10, :open, :user_confirmation
    FactoryGirl.create_list :event, 10, :open, :shipment
    start_date = DateTime.current - 7.days
    end_date = DateTime.current
    data_miner_preopeneder = DataMiner.new(start_date: start_date,
                                                   end_date: end_date)

    expect(data_miner_preopeneder.opened).to eq 20
  end

  it "returns a count of all opened emails of a certain type if specified" do
    FactoryGirl.create_list :event, 10, :open, :user_confirmation
    FactoryGirl.create_list :event, 10, :open, :shipment
    start_date = DateTime.current - 7.days
    end_date = DateTime.current
    data_miner_preopeneder = DataMiner.new(start_date: start_date,
                                                   end_date: end_date)

    expect(data_miner_preopeneder.opened(type: "Shipment")).to eq 10
  end
end

RSpec.describe DataMiner, "#opened" do
  it "returns a count of all opened emails if no type is given" do
    FactoryGirl.create_list :event, 10, :open, :user_confirmation
    FactoryGirl.create_list :event, 10, :open, :shipment
    start_date = DateTime.current - 7.days
    end_date = DateTime.current
    data_miner = DataMiner.new(start_date: start_date,
                                       end_date: end_date)

    expect(data_miner.opened).to eq 20
  end

  it "returns a count of all opened emails of a certain type if specified" do
    FactoryGirl.create_list :event, 10, :open, :user_confirmation
    FactoryGirl.create_list :event, 10, :open, :shipment
    start_date = DateTime.current - 7.days
    end_date = DateTime.current
    data_miner = DataMiner.new(start_date: start_date,
                                       end_date: end_date)

    expect(data_miner.opened(type: "Shipment")).to eq 10
  end
end

RSpec.describe DataMiner, "#clicked" do
  it "returns a count of all clicked emails if no type is given" do
    FactoryGirl.create_list :event, 10, :click, :user_confirmation
    FactoryGirl.create_list :event, 10, :click, :shipment
    start_date = DateTime.current - 7.days
    end_date = DateTime.current
    data_miner = DataMiner.new(start_date: start_date,
                                       end_date: end_date)

    expect(data_miner.clicked).to eq 20
  end

  it "returns a count of all clicked emails of a certain type if specified" do
    FactoryGirl.create_list :event, 10, :click, :user_confirmation
    FactoryGirl.create_list :event, 10, :click, :shipment
    start_date = DateTime.current - 7.days
    end_date = DateTime.current
    data_miner = DataMiner.new(start_date: start_date,
                                       end_date: end_date)

    expect(data_miner.clicked(type: "Shipment")).to eq 10
  end
end

RSpec.describe DataMiner, "#open_rate" do
  it "returns the open rate for all emails if no type is given" do
    FactoryGirl.create_list :event, 10, :send, :shipment
    FactoryGirl.create_list :event, 9, :send, :user_confirmation
    FactoryGirl.create_list :event, 5, :open, :shipment
    FactoryGirl.create_list :event, 2, :open, :user_confirmation

    start_date = DateTime.current - 7.days
    end_date = DateTime.current
    data_miner = DataMiner.new(start_date: start_date,
                                       end_date: end_date)

    expect(data_miner.open_rate).to eq 36.84
  end

  it "returns the open rate for a certain type if specified" do
    FactoryGirl.create_list :event, 10, :send, :shipment
    FactoryGirl.create_list :event, 9, :send, :user_confirmation
    FactoryGirl.create_list :event, 5, :open, :shipment
    FactoryGirl.create_list :event, 2, :open, :user_confirmation

    start_date = DateTime.current - 7.days
    end_date = DateTime.current
    data_miner = DataMiner.new(start_date: start_date,
                                       end_date: end_date)

    expect(data_miner.open_rate(type: "Shipment")).to eq 50.0
  end
end

RSpec.describe DataMiner, "#click_rate" do
  it "returns the open rate for all emails if no type is given" do
    FactoryGirl.create_list :event, 5, :send, :shipment
    FactoryGirl.create_list :event, 2, :send, :user_confirmation
    FactoryGirl.create_list :event, 1, :click, :shipment
    FactoryGirl.create_list :event, 2, :click, :user_confirmation

    start_date = DateTime.current - 7.days
    end_date = DateTime.current
    data_miner = DataMiner.new(start_date: start_date,
                                       end_date: end_date)

    expect(data_miner.click_rate).to eq 42.86
  end

  it "returns the open rate for a certain type if specified" do
    FactoryGirl.create_list :event, 5, :send, :shipment
    FactoryGirl.create_list :event, 2, :send, :user_confirmation
    FactoryGirl.create_list :event, 1, :click, :shipment
    FactoryGirl.create_list :event, 2, :click, :user_confirmation

    start_date = DateTime.current - 7.days
    end_date = DateTime.current
    data_miner = DataMiner.new(start_date: start_date,
                                       end_date: end_date)

    expect(data_miner.click_rate(type: "Shipment")).to eq 20.0
  end
end
