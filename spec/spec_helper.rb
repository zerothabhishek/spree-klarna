if ENV['COVERAGE']
  require 'simplecov'
  require 'coveralls'
  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
  ]
  SimpleCov.start do
    add_filter '/spec/'
    add_group 'Controllers', 'app/controllers'
    add_group 'Overrides', 'app/overrides'
    add_group 'Models', 'app/models'
    add_group 'Libraries', 'lib'
  end
end

ENV['RAILS_ENV'] = 'test'

require File.expand_path('../dummy/config/environment.rb', __FILE__)

require 'rspec/rails'
require 'i18n-spec'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'webmock/rspec'
require 'shoulda-matchers'
require 'elabs_matchers'
require 'excon'
require 'ffaker'
require 'database_cleaner'

Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |f| require f }

require 'spree/testing_support/factories'
require 'spree/testing_support/authorization_helpers'
require 'spree/testing_support/capybara_ext'
require 'spree/testing_support/controller_requests'
require 'spree/testing_support/order_walkthrough'
require 'spree/testing_support/preferences'
require 'spree/testing_support/url_helpers'

FactoryGirl.find_definitions

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Spree::TestingSupport::ControllerRequests
  config.include Spree::TestingSupport::UrlHelpers
  config.include Spree::TestingSupport::Preferences

  config.mock_with :rspec
  config.use_transactional_fixtures = false

  config.before :suite do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  config.before do
    DatabaseCleaner.strategy = example.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end

  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, { debug: true, inspector: true, js_errors: true })
  end
  Capybara.javascript_driver = :poltergeist
  Capybara.ignore_hidden_elements = false
end
