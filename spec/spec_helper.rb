require 'billys_billing'
#Dir[Dir.pwd.join("/spec/support/**/*.rb")].each {|f| require f}
require "#{Dir.pwd}/spec/support/invoice_macros"
RSpec.configure do |config|
  
  config.include InvoiceMacros
  
  
  config.before(:each) do
    BillysBilling.api_key = "OC9HNHdg3d5HF8cvTYMgtBoi53igPMuC"
  end
end