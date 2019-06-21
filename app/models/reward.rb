class Reward < ApplicationRecord
  require 'ostruct'
  attr_reader :data

  def self.create_reward(data)
    input_events = Input.new(data).format_data
    event_acceptors = []

    input_events.each do |event|
      events = Event.new(event).row_values
      event = events[0]
      event_participants = event[:participants]
      event = JSON.parse(event.to_json, object_class: OpenStruct)
      create(event_participants) unless event.participants.value.blank?

      Calculator.new(event.acceptor).calculate_points unless event.acceptor.value.blank?      
    end

    Calculator.overall_points
  end
end
