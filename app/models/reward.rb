class Reward < ApplicationRecord
  require 'ostruct'
  attr_reader :data

  def self.customer_rewards(data)
    input_events = Input.new(data).format_data
    Reward.assign(input_events)    
    Calculator.overall_points
  end

  def self.assign(input_events) 
    input_events.each do |event|              
      event_acceptors = []   
      events = Event.new(event).row_values
      event = events[0]
      event_participants = event[:participants]
      event = JSON.parse(event.to_json, object_class: OpenStruct)
      create(event_participants) unless event.participants.value.blank?
      Calculator.new(event.acceptor).calculate_points unless event.acceptor.value.blank? 
    end         
  end
end
