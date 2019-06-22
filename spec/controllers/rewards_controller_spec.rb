require 'rails_helper'

RSpec.describe RewardsController, :type => :controller do
  describe "GET crstomer_rewards" do
    it "Reads the data from input file and outputs the customer reward points" do
      get :get_rewards
      expect(response.body).to eq("{\"A\":1.75,\"B\":1.5,\"C\":1.0}")
    end
  end
end