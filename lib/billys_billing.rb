require 'billys_billing/client'
require 'billys_billing/config'

module BillysBilling
  extend Config
  class << self
    
    # Alias for BillysBilling::Client.new
    #
    # @return [BillysBilling::Client]
    def new(options={})
      BillysBilling::Client.new(options)
    end
    
    # Delegate to BillysBilling::Client
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
    
  end
  
end
