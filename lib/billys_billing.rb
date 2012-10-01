autoload :Account,"billys_billing/account"
autoload :Contact, "billys_billing/contact"
autoload :Invoice, "billys_billing/invoice"
autoload :Organization, "billys_billing/organization"
autoload :Payment, "billys_billing/payment"
autoload :Product, "billys_billing/product"
autoload :Vat_model, "billys_billing/vat_model"
autoload :Line, "billys_billing/line"


require 'hash'
require 'string'
require 'active_support/inflector'

require 'billys_billing/base'

require 'billys_billing/person'
require 'billys_billing/account'
require 'billys_billing/attachment'
require 'billys_billing/contact'
require 'billys_billing/daybook_transaction'
require 'billys_billing/vat_model'
require 'billys_billing/payment'
require 'billys_billing/product'
require 'billys_billing/line'
require 'billys_billing/invoice'

require 'billys_billing/organization'





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
