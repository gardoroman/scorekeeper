module Scorekeeper

  class CustomerScoring

    NUM_PATTERN = /\D/

    attr_reader :income, :zipcode, :age

    # initialize object with args containing income, zipcode, and age
    def initialize(args={})
      @income = args.fetch(:income, nil)
      @zipcode = args.fetch(:zipcode, nil)
      @age = args.fetch(:age, nil)
      validate_paramters
      check_values
    end

    private

    # ensures that the necessary parameters were passed in and that values conform to parameters required by API
    def validate_paramters
      raise Scorekeeper::MissingParameterException if @income.nil? || @zipcode.nil? || @age.nil?
    end

    # ensures that valid values are passed
    def check_values
      check_numericity
      check_zip_code
    end

    #ensures that income and age are numeric passes pattern that checks to see if there is a non-digit or negative number. If so the pattern match will not be nil and an error will be raised
    def check_numericity
      check_patterns(@income.to_s)
      check_patterns(@age.to_s)
    end

    # ensures that zip code is all digits and that length is equal to 5
    def check_zip_code
      zip_string = @zipcode.to_s
      raise InvalidParameterException if zip_string.size != 5
      # raise InvalidParameterException if (@zipcode.to_s =~ pattern)
      check_patterns(zip_string)
    end

    def check_patterns(number)
      raise InvalidParameterException unless (number =~ NUM_PATTERN).nil?
    end


  end
end
