class DataMiner
  def initialize(start_date:, end_date:)
    @start_date = start_date
    @end_date = end_date
  end

  def start_date
    DateTime.parse(@start_date.to_s)
  end

  def end_date
    DateTime.parse(@end_date.to_s)
  end

  def show_conversion_rates?
    sent > 0
  end

  def sent(type: all_email_types)
    event_count(type: type, event: "send")
  end

  def opened(type: all_email_types)
    event_count(type: type, event: "open")
  end

  def clicked(type: all_email_types)
    event_count(type: type, event: "click")
  end

  def open_rate(type: all_email_types)
    percentage_rate(
      numerator: sent(type: type),
      denominator: opened(type: type)
    )
  end

  def click_rate(type: all_email_types)
    percentage_rate(
      numerator: sent(type: type),
      denominator: clicked(type: type)
    )
  end

  def all_email_types
    @_all_email_types || Event.pluck(:email_type).uniq
  end

  def start_date_string
    start_date.strftime("%d %b %Y")
  end

  def end_date_string
    end_date.strftime("%d %b %Y")
  end

  private

  def event_count(type: all_email_types, event:)
    Event.where(event: event)
      .where(email_type: type)
      .where("timestamp > ?", start_date.beginning_of_day)
      .where("timestamp < ?", end_date.end_of_day)
      .count
  end

  def percentage_rate(numerator:, denominator:)
    ((100/numerator.to_f)*denominator.to_f).round(2)
  end
end
