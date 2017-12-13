require 'spec_helper'
describe ParseJson do
  describe 'Testing exchange rates' do
    before(:each)do
      @j = ParseJson.new('json_exchange_rates.json')
    end

    it "Should all be a hash" do
      expect(@j.json_file).to be_a(Hash)
    end

    it "base should be EUR" do
      expect(@j.get_base).to eq('EUR')
    end

    it "date should be the correct length" do
      expect(@j.get_date_length).to eq(10)
    end

    it "currency values should be floats" do
      @j.get_rates.each  do |key, value|
        expect(value).to be_a(Float)
      end
    end

    it "currency values should be positive" do
      @j.get_rates.each  do |key, value|
        expect(value).to be > (0)
      end
    end

    it "currency names should be three letters long and a string" do
      @j.get_rates.each  do |key, value|
        expect(key).to be_a(String)
        expect(key.length).to eq(3)
      end
    end


  end

end
