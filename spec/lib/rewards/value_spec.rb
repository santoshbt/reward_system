require 'rails_helper'

RSpec.describe Rewards::Value do
  describe '#seggregate_data' do    
    let(:data) do
     ["2018-06-12 09:41 A recommends B","2018-06-14 09:41 B accepts"]
    end

    let(:value) {described_class.new(data) }
    subject { value.members }

    it 'returns seggregated output' do
      puts subject.inspect      
      expect(subject).to eq([[{"A"=>"B"}], ["B"]])
    end
  end
end