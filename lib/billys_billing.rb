require "billys_billing/version"

require "billys_billing/account"
require "billys_billing/contact"
require "billys_billing/invoice"
require "billys_billing/organization"
require "billys_billing/payment"
require "billys_billing/product"
require "billys_billing/vat_model"

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
  
  def self.response(url = "/", method = :get, query = nil)
    case method
    when :get
      self.get(url, :query => query).parsed_response
    when :post
      self.post(url, :query => query).parsed_response
    when :delete
      self.delete(url, :query => query).parsed_response
    when :put
      self.put(url, :query => query).parsed_response
    end 
  end
  
  def self.auth(username = @@api_key)
    {:username => username, :password => ""}
  end
  
end
