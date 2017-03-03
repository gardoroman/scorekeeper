require 'spec_helper'

context Scorekeeper::CustomerScoring do

  describe "A valid CustomerScoring Object" do
    let(:customer_scoring){Scorekeeper::CustomerScoring.new( {'income': 50000, 'zipcode': 60201, 'age': 35} ) }

    it "should be a CustomerScoring object" do
      expect(customer_scoring).to be_a(Scorekeeper::CustomerScoring)
    end

    it "has a readable income" do
      expect(customer_scoring.income).to eq(50000)
    end

    it "has a readable zipcode" do
      expect(customer_scoring.zipcode).to eq(60201)
    end

    it "has a readable age" do
      expect(customer_scoring.age).to eq(35)
    end
  end

  describe "CustomerScoring object makes API calls" do
    
  end

end
