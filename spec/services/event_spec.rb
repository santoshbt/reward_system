require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '.row_values' do    
    let(:data) do
     "2018-06-12 09:41 A recommends B"
    end
    subject { described_class.new(data) }

    it 'returns extracted output' do
      result = subject.row_values
      expect(result).to eq([ participants: { value: "A", invitee: "B", recommendation_sent_on: "2018-06-12 09:41" },
                              acceptor: { value: nil, accepted_date: nil } ])
    end
  end
end