require 'rails_helper'

RSpec.describe Reward, type: :model do
  let(:data) do
    "2018-06-12 09:41 A recommends B
    2018-06-14 09:41 B accepts
    2018-06-16 09:41 B recommends C
    2018-06-17 09:41 C accepts
    2018-06-19 09:41 C recommends D
    2018-06-23 09:41 B recommends D
    2018-06-25 09:41 D accepts"
  end

  it "takes recommendation events and outputs individual points" do
    points = Reward.customer_rewards(data) 
    expect(points).to eq({"A"=>1.75, "B"=>1.5, "C"=>1.0})
  end
end
