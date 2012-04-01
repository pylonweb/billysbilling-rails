require "billys_billing/invoice/attachment"
require "billys_billing/invoice/line"

module BillysBilling
  module Invoice
    
    def self.list(contact_id = nil)
      BillysBilling.response("/invoices", :get, { :contactId => contact_id })
    end
    
    def self.get(id)
      BillysBilling.response("/invoices/#{id}")
    end
    
    def self.create(params)
      BillysBilling.response("/invoices", :post, params )
    end
    
    def self.update(id, params)
      BillysBilling.response("/invoices/#{id}", :put, params )
    end
    
    def self.delete(id)
      BillysBilling.response("/invoices/#{id}", :delete )
    end
    
  end
end