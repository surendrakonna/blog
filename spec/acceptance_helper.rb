require 'rails_helper'
require 'rspec_api_documentation'
require 'rspec_api_documentation/dsl'

RspecApiDocumentation.configure do |config|
  config.format = [:api_blueprint]
  config.request_headers_to_include = ['Content-Type', 'X-Access-Token']
  config.response_headers_to_include = ['Content-Type']
  config.api_name = 'Blog'
end
