ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/reporters"  # for Colorized output
require 'vcr'
require 'webmock/minitest'




# MonkeyPatch for This version of Rails :(
if ActionPack::VERSION::STRING >= "5.2.0"
  Minitest::Rails::TestUnit = Rails::TestUnit
end

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

#  For colorful output!
Minitest::Reporters.use!(
  Minitest::Reporters::SpecReporter.new,
  ENV,
  Minitest.backtrace_filter
)

VCR.configure do |config|
  # Where to save cassettes
  config.cassette_library_dir = 
    'test/cassettes'
  
  # Tie VCR and webmock together
  config.hook_into :webmock

  # Set it to record new data and
  # Match on the VERB, URI and body
  config.default_cassette_options = {
    record: :new_episodes,
    match_requests_on: [:method, :uri, :body]
  }
  
  config.filter_sensitive_data('<SLACK_TOKEN>') do
    ENV['SLACK_TOKEN']
  end
end


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
end
