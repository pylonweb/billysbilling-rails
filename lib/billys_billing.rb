require "billys_billing/version"
require "billys_billing/invoice"
require "httparty"

module BillysBilling
  include HTTParty
  
  @@api_key = nil
  @@api_url = 'https://api.billysbilling.dk/v1'
  base_uri @@api_url
  basic_auth @@api_key, ""

  # mattr_accessor :api_key
  def self.api_key=(api_key)
    @@api_key = api_key
    basic_auth @@api_key, ""
    response["success"]
  end
  
  def self.api_key
    @@api_key
  end
  
  # mattr_accessor :api_url
  def self.api_url=(api_url)
    @@api_url = api_url
    base_uri @@api_url
  end
  
  def self.api_url
    @@api_url
  end
  
  def self.configure
    yield self
  end
  
  def self.response(url = "/", method = :get)
    self.eval(method)(url).parsed_response
  end
  

  
  def self.auth(username = @@api_key)
    {:username => username, :password => ""}
  end
  
end
