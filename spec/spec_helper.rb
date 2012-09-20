require 'billys_billing'
require 'webmock/rspec'
require 'vcr'

Dir["#{Dir.pwd}/spec/support/**/*.rb"].each {|file| require file }
RSpec.configure do |config|
  
  config.include InvoiceMacros
  
  

  
  config.before(:each) do
    BillysBilling.configure do |config|
      config.api_key = "JYRkRPBsukN6YmV6PbouDQg8VclmAFzc"
    end
    
  end
end

#VCR config
VCR.config do |c|
  c.cassette_library_dir = 'spec/fixtures/dish_cassettes'
  c.stub_with :webmock
end