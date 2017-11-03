# frozen_string_literal: true

require 'capybara/rails'
require 'capybara/poltergeist'

Capybara.register_driver :poltergeist do |app|
  options = {
    js_errors: true,
    phantomjs_options: ['--load-images=no'],
    inspector: true
  }
  Capybara::Poltergeist::Driver.new(app, options)
end
Capybara.javascript_driver = :poltergeist
