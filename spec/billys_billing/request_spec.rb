require "spec_helper"

describe BillysBilling::Request do
  it "must include httparty methods" do
    BillysBilling::Request.should_include HTTParty
  end
  it "must have the base url set to the Billys Billing API endpoint" do
    BillysBilling::Request.base_uri.should_equal 'https://api.billysbilling.dk/v1'
  end
end