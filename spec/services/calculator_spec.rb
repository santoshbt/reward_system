require 'rails_helper'

RSpec.describe Calculator do
  describe '#calculate_points' do   
    let(:acceptor) do
      JSON.parse({value: "B", accepted_date: "2018-06-14 09:41"}.to_json, object_class: OpenStruct)   
    end

    subject { described_class.new(acceptor) }
    it 'updates reward to 1.0' do
      reward = create(:reward)      
      subject.calculate_points
      expect(reward.reload.points).to eq(1.0)
    end
  end
end