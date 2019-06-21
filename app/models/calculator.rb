class Calculator
  attr_reader :acceptor
  DIRECT_INVITOR_POINTS = 1.0
  FIRST_COEFFICIENT = 0.5
  SECOND_COEFFICIENT = 0.25

  def initialize(acceptor)
    @acceptor = acceptor
  end

  def calculate_points
    invitee = acceptor.value
    first_level_invitor = update_points(invitee, DIRECT_INVITOR_POINTS)

    invitee = first_level_invitor.value
    second_level_points = first_level_invitor.points + FIRST_COEFFICIENT
    second_level_invitor = update_points(invitee, second_level_points)

    unless second_level_invitor.blank?
      invitee = second_level_invitor.value
      third_level_points = second_level_invitor.points + SECOND_COEFFICIENT
      third_level_invitor = update_points(invitee, third_level_points)
    end
  end

  def self.overall_points
    rewards = Reward.pluck(:value, :points)
    Hash[ rewards.sort_by { |key, val| key } ]
  end

  private
  def update_points(invitee, points)
    invitor = Reward.where("invitee = ?", invitee).order("recommendation_sent_on ASC").first
    invitor.update_attributes(points: points, accept_flag: true) unless invitor.nil?
    return invitor
  end
end