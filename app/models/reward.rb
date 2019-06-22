class Reward < ApplicationRecord
  require 'ostruct'
  attr_reader :data
  validates :value, presence: true
  validates :invitee, presence: true

  def self.customer_rewards(data)
    input_events = Input.new(data).format_data
    assign_points(input_events)    
    overall_points
  end

  ##### Save only Recommendation participants into the database
  ##### Recommendation combination shoupd not be duplicate
  ##### Whenever acceptor is encountered calculate the points

  def self.assign_points(input_events) 
    input_events.each do |event|             
      events = Event.new(event).row_values
      event = events[0]
      event_participants = event[:participants]
      event = JSON.parse(event.to_json, object_class: OpenStruct)
      if !event.participants.value.blank? && !duplicate_combination?(event.participants)
        create(event_participants)          
      end
      Calculator.new(event.acceptor).calculate_points unless event.acceptor.value.blank? 
    end         
  end

  def self.overall_points
    rewards = Reward.pluck(:value, :points)
    Hash[ rewards.sort_by { |key, val| key } ]
  end

  def self.duplicate_combination?(participants)
    duplicate_combination = find_by(value: participants.value, invitee: participants.invitee)
    return true if duplicate_combination
    return false 
  end
end
