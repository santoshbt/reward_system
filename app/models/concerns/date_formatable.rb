module DateFormatable
  include ActiveSupport::Concern

  def convert(date, time)
    unless date.blank? && time.blank?
      date_time = date + " " + time
      return DateTime.parse(date_time)
    end
    return nil
  end
end