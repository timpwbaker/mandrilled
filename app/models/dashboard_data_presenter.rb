class DashboardDataPresenter
  attr_reader :start_date, :end_date

  def initialize(start_date:, end_date:)
    @start_date = start_date || DateTime.current.beginning_of_year
    @end_date = end_date || DateTime.current
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
      numerator: opened(type: type),
      denominator: clicked(type: type)
    )
  end

  def all_email_types
    @_all_email_types || Event.pluck(:email_type).uniq
  end

  private

  def event_count(type: all_email_types, event:)
    Event.where(event: event)
      .where(email_type: type)
      .where("created_at > ?", start_date)
      .where("created_at < ?", end_date)
      .count
  end

  def percentage_rate(numerator:, denominator:)
    begin
      ((100/numerator.to_f)*denominator.to_f).round(2)
    rescue
      0
    end
  end
end
