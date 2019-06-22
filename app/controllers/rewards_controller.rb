class RewardsController < ApplicationController
  def get_rewards
    path = Rails.root.join('public','input.txt')
    input_lines = FileReader.new(path).read_data

    Reward.assign(input_lines)
    rewards = Calculator.overall_points   
    
    render json: rewards, status: :ok
  end
end