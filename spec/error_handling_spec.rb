require 'spec_helper'

context "Raise Errors for inputs" do
  describe "MissingParameterException" do
    let(:no_income){Scorekeeper::CustomerScoring.new( {'zipcode': 60201, 'age': 35} ) }
    let(:no_zip){Scorekeeper::CustomerScoring.new( {'income': 50000, 'age': 35} ) }
    let(:no_age){Scorekeeper::CustomerScoring.new( {'income': 50000, 'zipcode': 60201} ) }

    it "should raise an error if income is missing" do
      expect { no_income.income }.to raise_error(Scorekeeper::MissingParameterException)
    end

    it "should raise an error if zip code is missing" do
      expect { no_zip }.to raise_error(Scorekeeper::MissingParameterException)
    end

    it "should raise an error if age is missing" do
      expect { no_age }.to raise_error(Scorekeeper::MissingParameterException)
    end

  end
  #
  describe "InvalidParameterException for non digit numbers" do
    let(:invalid_income){Scorekeeper::CustomerScoring.new( {'income': 'xyz', 'zipcode': 60201, 'age': 35} ) }
    let(:invalid_age){Scorekeeper::CustomerScoring.new( {'income': 50000, 'zipcode': 60201, 'age': 'abc'} ) }

    it "should raise an error if income is not a number" do
      expect { invalid_income }.to raise_error(Scorekeeper::InvalidParameterException)
    end

    it "should raise an error if age is invalid" do
      expect { invalid_age }.to raise_error(Scorekeeper::InvalidParameterException)
    end
  end

  describe "InvalidParameterException for negative numbers" do
    let(:negative_income){Scorekeeper::CustomerScoring.new( {'income': -50000, 'zipcode': 60201, 'age': 35} ) }
    let(:negative_age){Scorekeeper::CustomerScoring.new( {'income': 50000, 'zipcode': 60201, 'age': -35} ) }

    it "should raise an error if income is negative" do
      expect { negative_income }.to raise_error(Scorekeeper::InvalidParameterException)
    end

    it "should raise an error if age is negative" do
      expect { negative_age }.to raise_error(Scorekeeper::InvalidParameterException)
    end
  end

  # describe "InvalidParameterException for invalid zip codes" do
  #   let(:non_digit_zip){Scorekeeper::CustomerScoring.new( {'income': 50000, 'zipcode': '6*zy1', 'age': 35} ) }
  #   let(:long_zip){Scorekeeper::CustomerScoring.new( {'income': 50000, 'zipcode': 602016, 'age': 35} ) }
  #   let(:short_zip){Scorekeeper::CustomerScoring.new( {'income': 50000, 'zipcode': 2, 'age': 35} ) }
  #
  #   it "should raise an error if zip code contains non-digits" do
  #     expect {non_digit_zip}.to raise_error(Scorekeeper::InvalidParameterException)
  #   end
  # end

end
