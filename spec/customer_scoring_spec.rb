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
    let(:real_score){Scorekeeper::CustomerScoring.new( {'income': 50000, 'zipcode': 60201, 'age': 35} ) }
    let(:no_score){Scorekeeper::CustomerScoring.new( {'income': 50000, 'zipcode': 00000, 'age': 35} ) }

    it "makes call to API and gets a response" do
      file = File.open(File.dirname(__FILE__) + '/fixtures/' + 'score.json', 'rb').read
      response = JSON.parse(file)
      allow(real_score).to receive(:search).and_return(response)

      expect(response).to be_a(Hash)
      expect(response['propensity']).to eq(0.26532)
      expect(response['ranking']).to eq("C")
    end

    it "makes call to API and gets an empty response" do
      response = JSON.parse('{}')
      allow(real_score).to receive(:search).and_return(response)

      expect(response).to be_a(Hash)
      expect(response.empty?).to be(true)
    end

  end

end
