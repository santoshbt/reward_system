class Event
  attr_reader :event_row
  RECOMMENDS = "recommends"
  ACCEPTS = "accepts"

  def initialize event_row
    @event_row = event_row
  end

  def row_values
    required_values = event_row.split(" ")
    date, time = required_values.take(2)

    if required_values[3] == RECOMMENDS      
      recommended_date = format_date(date, time)
      value = required_values[2]
      invitee = required_values[4] 
    else
      acceptor_value = required_values[2]
      accepted_date = format_date(date, time)      
    end
    return [ participants: { value: value, invitee: invitee, recommendation_sent_on: recommended_date },
             acceptor: { value: acceptor_value, accepted_date: accepted_date } ]
  end

  def format_date(date, time)
    date_time = date + " " + time
    DateTime.parse(date_time)
  end
end