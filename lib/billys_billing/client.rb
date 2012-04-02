require 'billys_billing/config'
require "billys_billing/request"

require "billys_billing/account"
require "billys_billing/contact"
require "billys_billing/invoice"
require "billys_billing/organization"
require "billys_billing/payment"
require "billys_billing/product"
require "billys_billing/vat_model"


module BillysBilling
  # Wrapper for the BillysBilling REST API
  
  class Client
    include BillysBilling::Request
    
    require 'billys_billing/client/base'
    include BillysBilling::Client::Base
    
    attr_accessor *Config::VALID_OPTIONS_KEYS
    
    # Initializes a new API object
    #
    # @param attrs [Hash]
    # @return [BillysBilling::Client]
    def initialize(attrs={})
      attrs = BillysBilling.options.merge(attrs)
      Config::VALID_OPTIONS_KEYS.each do |key|
        instance_variable_set("@#{key}".to_sym, attrs[key])
      end
    end
    
    
  end
end