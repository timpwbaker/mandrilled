require "rails_helper"

RSpec.describe DataMiner, "#sent" do
  it "returns a count of all sent emails if no type is given" do
    FactoryGirl.create_list :event, 10, :now, :send, :user_confirmation
    FactoryGirl.create_list :event, 10, :now, :send, :shipment
    start_date = (Date.today - 7.days).beginning_of_day
    end_date = Date.today.end_of_day
    data_miner = DataMiner.new(start_date: start_date,
                                       end_date: end_date)

    expect(data_miner.sent).to eq 20
  end

  it "returns a count of all sent emails of a certain type if specified" do
    FactoryGirl.create_list :event, 10, :now, :send, :user_confirmation
    FactoryGirl.create_list :event, 10, :now, :send, :shipment
    start_date = (Date.today - 7.days).beginning_of_day
    end_date = Date.today.end_of_day
    data_miner = DataMiner.new(start_date: start_date,
                                       end_date: end_date)

    expect(data_miner.sent(type: "Shipment")).to eq 10
  end
end

RSpec.describe DataMiner, "#opened" do
  it "returns a count of all opened emails if no type is given" do
    FactoryGirl.create_list :event, 10, :now, :open, :user_confirmation
    FactoryGirl.create_list :event, 10, :now, :open, :shipment
    start_date = (Date.today - 7.days).beginning_of_day
    end_date = Date.today.end_of_day
    data_miner_preopeneder = DataMiner.new(start_date: start_date,
                                                   end_date: end_date)

    expect(data_miner_preopeneder.opened).to eq 20
  end

  it "returns a count of all opened emails of a certain type if specified" do
    FactoryGirl.create_list :event, 10, :now, :open, :user_confirmation
    FactoryGirl.create_list :event, 10, :now, :open, :shipment
    start_date = (Date.today - 7.days).beginning_of_day
    end_date = Date.today.end_of_day
    data_miner_preopeneder = DataMiner.new(start_date: start_date,
                                                   end_date: end_date)

    expect(data_miner_preopeneder.opened(type: "Shipment")).to eq 10
  end
end

RSpec.describe DataMiner, "#opened" do
  it "returns a count of all opened emails if no type is given" do
    FactoryGirl.create_list :event, 10, :now, :open, :user_confirmation
    FactoryGirl.create_list :event, 10, :now, :open, :shipment
    start_date = (Date.today - 7.days).beginning_of_day
    end_date = Date.today.end_of_day
    data_miner = DataMiner.new(start_date: start_date,
                                       end_date: end_date)

    expect(data_miner.opened).to eq 20
  end

  it "returns a count of all opened emails of a certain type if specified" do
    FactoryGirl.create_list :event, 10, :now, :open, :user_confirmation
    FactoryGirl.create_list :event, 10, :now, :open, :shipment
    start_date = (Date.today - 7.days).beginning_of_day
    end_date = Date.today.end_of_day
    data_miner = DataMiner.new(start_date: start_date,
                                       end_date: end_date)

    expect(data_miner.opened(type: "Shipment")).to eq 10
  end
end

RSpec.describe DataMiner, "#clicked" do
  it "returns a count of all clicked emails if no type is given" do
    FactoryGirl.create_list :event, 10, :now, :click, :user_confirmation
    FactoryGirl.create_list :event, 10, :now, :click, :shipment
    start_date = (Date.today - 7.days).beginning_of_day
    end_date = Date.today.end_of_day
    data_miner = DataMiner.new(start_date: start_date,
                                       end_date: end_date)

    expect(data_miner.clicked).to eq 20
  end

  it "returns a count of all clicked emails of a certain type if specified" do
    FactoryGirl.create_list :event, 10, :now, :click, :user_confirmation
    FactoryGirl.create_list :event, 10, :now, :click, :shipment
    start_date = (Date.today - 7.days).beginning_of_day
    end_date = Date.today.end_of_day
    data_miner = DataMiner.new(start_date: start_date,
                                       end_date: end_date)

    expect(data_miner.clicked(type: "Shipment")).to eq 10
  end
end

RSpec.describe DataMiner, "#open_rate" do
  it "returns the open rate for all emails if no type is given" do
    FactoryGirl.create_list :event, 10, :now, :send, :shipment
    FactoryGirl.create_list :event, 9, :now, :send, :user_confirmation
    FactoryGirl.create_list :event, 5, :now, :open, :shipment
    FactoryGirl.create_list :event, 2, :now, :open, :user_confirmation

    start_date = (Date.today - 7.days).beginning_of_day
    end_date = Date.today.end_of_day
    data_miner = DataMiner.new(start_date: start_date,
                                       end_date: end_date)

    expect(data_miner.open_rate).to eq 36.84
  end

  it "returns the open rate for a certain type if specified" do
    FactoryGirl.create_list :event, 10, :now, :send, :shipment
    FactoryGirl.create_list :event, 9, :now, :send, :user_confirmation
    FactoryGirl.create_list :event, 5, :now, :open, :shipment
    FactoryGirl.create_list :event, 2, :now, :open, :user_confirmation

    start_date = (Date.today - 7.days).beginning_of_day
    end_date = Date.today.end_of_day
    data_miner = DataMiner.new(start_date: start_date,
                                       end_date: end_date)

    expect(data_miner.open_rate(type: "Shipment")).to eq 50.0
  end
end

RSpec.describe DataMiner, "#click_rate" do
  it "returns the open rate for all emails if no type is given" do
    FactoryGirl.create_list :event, 5, :now, :send, :shipment
    FactoryGirl.create_list :event, 2, :now, :send, :user_confirmation
    FactoryGirl.create_list :event, 1, :now, :click, :shipment
    FactoryGirl.create_list :event, 2, :now, :click, :user_confirmation

    start_date = (Date.today - 7.days).beginning_of_day
    end_date = Date.today.end_of_day
    data_miner = DataMiner.new(start_date: start_date,
                                       end_date: end_date)

    expect(data_miner.click_rate).to eq 42.86
  end

  it "returns the open rate for a certain type if specified" do
    FactoryGirl.create_list :event, 5, :now, :send, :shipment
    FactoryGirl.create_list :event, 2, :now, :send, :user_confirmation
    FactoryGirl.create_list :event, 1, :now, :click, :shipment
    FactoryGirl.create_list :event, 2, :now, :click, :user_confirmation

    start_date = (Date.today - 7.days).beginning_of_day
    end_date = Date.today.end_of_day
    data_miner = DataMiner.new(start_date: start_date,
                                       end_date: end_date)

    expect(data_miner.click_rate(type: "Shipment")).to eq 20.0
  end
end
