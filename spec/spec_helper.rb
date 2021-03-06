if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start
end

require 'bundler/setup'
Bundler.setup

require 'mrkt'

Dir[File.expand_path('spec/support/**/*.rb')].sort.each do |file|
  require file
end

RSpec.configure do |config|
  config.default_formatter = :doc if config.files_to_run.one?

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.order = :random
  Kernel.srand config.seed

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end
end
