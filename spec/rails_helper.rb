# spec/rails_helper.rb

ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../config/environment", __dir__)
abort("O ambiente de teste está rodando em um banco de dados de produção!") if Rails.env.production?
require "rspec/rails"

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

RSpec.configure do |config|
  config.before(:suite) do
    Rails.application.load_seed
  end

  config.use_transactional_fixtures = true

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.include Shoulda::Matchers::ActiveModel, type: :model
end
