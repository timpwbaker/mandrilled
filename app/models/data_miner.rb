class DataMiner
  def initialize(start_date:, end_date:)
    @start_date = start_date
    @end_date = end_date
  end

  def show_conversion_rates?
    sent > 0
  end

  def last_ten_events
    Event
      .order_by_timestamp
      .last(10)
  end

  def sent(type: all_email_types)
    Rails.cache.fetch("sent_#{type}_#{start_date}_#{end_date}", expires_in: cache_expire_time) do
      event_count(type: type, event: "send")
    end
  end

  def opened(type: all_email_types)
    Rails.cache.fetch("opened_#{type}_#{start_date}_#{end_date}", expires_in: cache_expire_time) do
      event_count(type: type, event: "open")
    end
  end

  def clicked(type: all_email_types)
    Rails.cache.fetch("clicked_#{type}_#{start_date}_#{end_date}", expires_in: cache_expire_time) do
      event_count(type: type, event: "click")
    end
  end

  def open_rate(type: all_email_types)
    Rails.cache.fetch("open_rate_#{type}_#{start_date}_#{end_date}", expires_in: cache_expire_time) do
      percentage_rate(
        numerator: sent(type: type),
        denominator: opened(type: type)
      )
    end
  end

  def click_rate(type: all_email_types)
    Rails.cache.fetch("click_rate_#{type}_#{start_date}_#{end_date}", expires_in: cache_expire_time) do
      percentage_rate(
        numerator: sent(type: type),
        denominator: clicked(type: type)
      )
    end
  end

  def all_email_types
    @_all_email_types ||= Rails.cache.fetch("email_types", expires_in: 12.hours) do
      Event.pluck(:email_type).uniq
    end
  end

  private

  def cache_expire_time
    if end_date == Date.today
      1.hour
    else
      2.weeks
    end
  end

  def start_date
    DateTime.parse(@start_date.to_s)
  end

  def end_date
    DateTime.parse(@end_date.to_s)
  end

  def event_count(type: all_email_types, event:)
    Event.where(event: event)
      .where(email_type: type)
      .where("timestamp > ?", start_date)
      .where("timestamp < ?", end_date)
      .count
  end

  def percentage_rate(numerator:, denominator:)
    ((100/numerator.to_f)*denominator.to_f).round(2)
  end
end
