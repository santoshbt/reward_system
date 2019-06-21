require 'rails_helper'

RSpec.describe Rewards::Input do
  describe '.format_data' do    
    let(:data) do
     "2018-06-12 09:41 A recommends B
     2018-06-14 09:41 B accepts
     2018-06-16 09:41 B recommends C"
    end

    let(:input) {described_class.new(data) }
    subject { input.format_data }

    it 'returns input length 3' do
      puts subject.inspect
      expect(subject.size).to eq(3)
      expect(subject).to eq(["2018-06-12 09:41 A recommends B", 
                             "2018-06-14 09:41 B accepts",
                             "2018-06-16 09:41 B recommends C"])
    end
  end
end