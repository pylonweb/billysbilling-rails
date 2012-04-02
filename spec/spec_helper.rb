require 'billys_billing'
#Dir[Dir.pwd.join("/spec/support/**/*.rb")].each {|f| require f}
require "#{Dir.pwd}/spec/support/invoice_macros"
RSpec.configure do |config|
  
  config.include InvoiceMacros
  
  

  
  config.before(:each) do
    BillysBilling.configure do |config|
      config.api_key = "JYRkRPBsukN6YmV6PbouDQg8VclmAFzc"
    end
    
  end
end