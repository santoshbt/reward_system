require 'rails_helper'

RSpec.describe Input do
  describe '.format_data' do    
    let(:data) do
     "2018-06-12 09:41 A recommends B
     2018-06-14 09:41 B accepts
     2018-06-16 09:41 B recommends C"
    end
    
    subject { described_class.new(data) }

    it 'returns input length 3 and its rows' do
      result = subject.format_data 
      expect(result.size).to eq(3)
      expect(result).to eq(["2018-06-12 09:41 A recommends B", 
                             "2018-06-14 09:41 B accepts",
                             "2018-06-16 09:41 B recommends C"])
    end
  end
end