# Scorekeeper
[![Build Status](https://travis-ci.org/gardoroman/scorekeeper.svg?branch=master)](https://travis-ci.org/gardoroman/scorekeeper)
This is gem is a library built for an anonymous company called the Jumping Amphibian.
The library integrates an API which scores a consumer based on the consumer's income, zipcode, and age.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'scorekeeper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install scorekeeper

## Usage

*Dependencies*

* Tested with Ruby 2.3.1 (has not been tested with other versions)
* JSON
* HTTParty

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## More on Tests

There are two sets of tests. One for testing the main functionality of the CustomerScoring object and the second for running validations and error handling.
Run the tests as follows from the command line:

    $ rspec spec/customer_scoring_spec.rb
    $ rspec spec/error_types_spec.rb

To update the expected response from the API call, update the json file at `spec/fixtures/score.json`

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gardoroman/scorekeeper.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
